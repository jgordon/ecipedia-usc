;; ECIpedia: Space: Angles
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

;; The first argument of `vertex`, which doesn't have a unique predicate
;; in the FOL axioms.
(def-eci angle (abstraction)
  :comment
  "An angle.")

(def-eci right-angle (angle)
  :comment
  "An angle is a right angle if the anchor point of an equal angle lies on
  the y-axis. This definition admits both 90-degree and 270-degree
  directed angles."
  :properties (:usc rightAngle))

(def-eci acute-angle (angle)
  :comment
  "An angle is acute if the x- and y-coordinates of the anchor point of an
  equal anchored angle are both greater than the origin."
  :properties (:usc acuteAngle))

(def-eci obtuse-angle (angle)
  :comment
  "An angle is obtuse if the y-coordinate of the anchor point of an equal
  anchored angle is greater than the origin and the x-coordinate is less
  than the origin."
  :properties (:usc obtuseAngle))

(def-eci 45-degree-angle (acute-angle)
  :comment
  "A 45-degree angle is one whose `anchor-point` has equal x- and
  y-coordinates. 45-degree angles form the basis of the system of identifying
  directions as north, northeast, east, southeast, south, southwest, west,
  or northwest."
  :properties (:usc 45Degrees))

(def-eci 30-degree-angle (acute-angle)
  :comment
  "A 30-degree angle is one in which the distance from the origin to the
  `anchor-point` is twice the y-coordinate. 30-degree angles form the basis
  of the system of identifying directions visualized as a clock."
  :properties (:usc 30Degrees))

(def-eci rectangle (quadrilateral)
  :comment
  "A rectangle is a quadrilateral whose vertices are all right angles."
  :properties (:usc rectangle))

(def-eci square (rhombus rectangle)
  :comment
  "A square is a rhombus that is a rectangle."
  :properties (:usc square))


;;
;; Predicates
;;

(def-eci base-of-angle (predicate)
  :comment
  "For an everyday notion of 'angle', where all angles are greater than
  0 degrees and less than 180 degrees, we define the base of the angle (line
  segment `c`) by constructing an isosceles triangle whose apex is a given
  vertex `v`, by identifying a point a unit distance out on each leg from
  the vertex. This lets us compare the size of angles by comparing the
  length of their bases."
  :properties (:usc baseOfAngle)
  :args ((@c :isa line-segment)
         (@v :isa angle)
         (@u :isa spatial-unit)))

(def-eci equal-angle (predicate)
  :comment
  "The angles of vertices `v1` and `v2` are of equal size, based on the
  length of each `base-of-angle`. This is reflexive, symmetric, and
  transitive."
  :properties (:usc equalAngle)
  :args ((@v1 :isa angle)
         (@v2 :isa angle)))

(def-eci greater-angle (predicate)
  :comment
  "The angle of vertex `v1` is greater than angle of vertex `v2`, based on
  the length of each `base-of-angle`. This is anti-reflexive, anti-symmetric,
  and transitive."
  :properties (:usc gtAngle)
  :args ((@v1 :isa angle)
         (@v2 :isa angle)))

(def-eci anchor-framework (predicate)
  :comment
  "An anchor framework `f` for the angle of the vertex `v` (with sides `c1`
  and `c2` that meet at point `o`) has an x-axis that contains one of the
  side `c1` and whose origin `o` coincides with the vertex. The size of
  the angle can then be correlated with the y-coordinate."
  :properties (:usc anchorFramework)
  :args ((@f :isa framework)
         (@v :isa angle)
         (@c1 :isa linear-curve)
         (@c2 :isa linear-curve)
         (@o :isa point)))

(def-eci anchor-point (predicate)
  :comment
  "`x` is an anchor point in framework `f` whose origin is `o`, `v` is a
  vertex at `o` whose side `c1` lies along f's x-axis, and `x` is a point
  in `v`'s other side `c2` one distance unit `u` from the origin."
  :properties (:usc anchorPoint)
  :args ((@x :isa point)
         (@v :isa angle)
         (@f :isa framework)
         (@c1 :isa linear-curve)
         (@c2 :isa linear-curve)
         (@o :isa point)
         (@u :isa spatial-unit)))

(def-eci diagonal-of-square (predicate)
  :comment
  "`d` is the diagonal of square `p`, a line segment from one vertex to an
  opposite vertex. A diagonal of a square makes a 45-degree angle with any
  side of the square."
  :properties (:usc diagonal)
  :args ((@d :isa line-segment)
         (@p :isa square)))

(def-eci direction (predicate)
  :comment
  "A direction with respect to a framework `f` is a ray `d` whose endpoint is
  the origin of the framework."
  :properties (:usc direction)
  :args ((@d :isa ray)
         (@f :isa framework)))

(def-eci direction-of (predicate)
  :comment
  "The direction of a linear object with respect to a framework `f` is a
  ray `d` that is parallel to the object `c`. Note that a line segment will
  have two directions, 180 degrees apart."
  :properties (:usc directionOf)
  :args ((@d :isa ray)
         (@c :isa linear-curve)
         (@f :isa framework)))
