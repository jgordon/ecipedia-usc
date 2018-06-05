;; ECIpedia: Space: Topology
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

(def-eci spatial-entity (abstraction)
  :comment
  "ECI definition for SPATIAL-ENTITY"
  :properties (:usc figure))

(def-eci point (spatial-entity)
  :comment
  "A point is a 0-dimensional spatial entity."
  :properties (:usc point))

;; I take the existing ECIpedia `spatial-region` to be any kind of figure
;; of 1 or more dimension, since that seems to be the useful level of
;; generalization, e.g., for the ground of `inside`.

(def-eci curve (spatial-region)
  :comment
  "A curve is a 1-dimensional spatial region."
  :properties (:usc curve))

(def-eci 2d-region (spatial-region)
  :comment
  "A spatial region is a 2-dimensional spatial region."
  :properties (:usc region))

(def-eci volume (spatial-region)
  :comment
  "A volume is a 3-dimensional spatial region."
  :properties (:usc volume))

(def-eci linear-curve (curve)
  :comment
  "A straight curve; defined to be a spatial subentity of some line."
  :properties (:usc linear))

(def-eci line (linear-curve)
  :comment
  "A line is a linear curve that does not have endpoints."
  :properties (:usc line))

(def-eci ray (linear-curve)
  :comment
  "A ray is a linear curve that has exactly one endpoint."
  :properties (:usc ray))

(def-eci line-segment (linear-curve)
  :comment
  "A line segment is a linear curve that has two distinct endpoints."
  :properties (:usc lineSegment))

(def-eci closed-curve (curve)
  :comment
  "A curve is closed if it has no endpoints."
  :properties (:usc closed))

(def-eci plane (2d-region)
  :comment
  "A plane is a 2-dimensional region such that if a line passes through any
  two points in the region, it is inside the region."
  :properties (:usc plane))

(def-eci planar-entity (spatial-entity)
  :comment
  "A spatial entity is planar if it is inside a plane."
  :properties (:usc planar))

(def-eci convex (planar-entity 2d-region)
  :comment
  "A planar region is convex if every point on a line segment between any
  two points on the boundary is inside the region."
  :properties (:usc convex))

(def-eci concave (planar-entity 2d-region)
  :comment
  "A planar region is concave if it is not convex."
  :properties (:usc concave))


;;
;; Relations
;;

;; Copying the arguments from ECIpedia; I'm only asserting that their
;; `inside-region` (defined for an entity subject) is basically the same
;; as our `inside`, even though we define it for abstract spatial entities.
;; I've switched `@ground` from the (seemingly) undefined `contained-region`
;; to `spatial-region`, used in the 1+-dimension meaning mentioned above.
(def-eci inside-region (containment-relation)
  :comment
  "A spatial entity can be inside a spatial entity of the same or higher
  dimension. If a spatial entity `e1` is inside spatial entity `e2`, then
  there is at least one point they share, and all of `e1`'s points are
  also inside `e2`. We do not commit to whether endpoints are inside curves,
  borders inside their regions, or surface inside their volumes."
  :properties (:usc inside)
  :args ((@ground :isa spatial-region)))

(def-eci on-boundary (relative-spatial-relation)
  :comment
  "A spatial entity can be on the boundary (endpoint/border/surface) of a
  spatial entity of a higher dimension."
  :properties (:usc onBoundary)
  :args ((@f1 :isa spatial-entity)
         (@f2 :isa spatial-entity)))


;;
;; Predicates
;;

(def-eci endpoint (predicate)
  :comment
  "The 0-dimensional point `x` is an endpoint of the 1-dimensional
  curve `c`."
  :properties (:usc endpoint)
  :args ((@x :isa point)
         (@c :isa curve)))

(def-eci border (predicate)
  :comment
  "The 1-dimensional curve `c` is the border of the 2-dimensional
  region `r`. Some regions, such as the surface of a sphere, do not have
  borders."
  :properties (:usc border)
  :args ((@c :isa curve)
         (@r :isa 2d-region)))

(def-eci surface (predicate)
  :comment
  "The 2-dimensional region `r` is the surface of the 3-dimensional
  volume `v`."
  :properties (:usc surface)
  :args ((@r :isa 2d-region)
         (@v :isa volume)))

(def-eci spatial-subentity (predicate)
  :comment
  "A spatial entity `f1` that is inside or on the boundary of another spatial
  entity, `f2`."
  :properties (:usc subfigure)
  :args ((@f1 :isa spatial-entity)
         (@f2 :isa spatial-entity)))

(def-eci tangential-proper-part (predicate)
  :comment
  "Region connection calculus (RCC8) concept of a tangential proper part for
  2- and 3-dimensional spatial regions."
  :properties (:usc tpp)
  :args ((@r1 :isa spatial-region)
         (@r2 :isa spatial-region)))

(def-eci line-segment-from-to (predicate)
  :comment
  "A line segment characterized by its endpoints, `x1` and `x2`."
  :properties (:usc lineSegmentFromTo)
  :args ((@c :isa line-segment)
         (@x1 :isa point)
         (@x2 :isa point)))

(def-eci coplanar (predicate)
  :comment
  "Two spatial entities are coplanar if there is a plane that they are both
  inside."
  :properties (:usc coplanar)
  :args ((@f1 :isa spatial-entity)
         (@f2 :isa spatial-entity)))

(def-eci parallel (predicate)
  :comment
  "Two spatial entities are parallel if they are inside two parallel lines.
  Two lines are parallel if they are coplanar and they have no points in
  common."
  :properties (:usc parallel)
  :args ((@c1 :isa spatial-entity)
         (@c2 :isa spatial-entity)))
