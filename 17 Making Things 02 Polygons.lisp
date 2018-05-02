;; ECIpedia: Making Things: Polygons
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

(def-eci polygon2 (2d-region)
  :comment
  "A polygon2 is a two-dimensional spatial region enclosed by a `polygon`,
  defined as a one-dimensional curve."
  :properties (:usc polygon2))

(def-eci quadrilateral (curve)
  :comment
  "A quadrilateral is one-dimensional curve consisting that is a `polygon`
  with four sides."
  :properties (:usc quadrilateral))

;;
;; Predicates
;;

(def-eci joined-curves (predicate)
  :comment
  "`c` is a curve formed by joining curves `c1` and `c2` at `x`, which is
  an endpoint of each. This is used as a first step toward defining polygons.
  We join two curves with endpoints by stipulating that one endpoint of one
  coincides with one endpoint of the other. Note that we can join two rays,
  but we cannot join two lines since lines, being infinite, have no
  endpoints."
  :properties (:usc joinedCurves)
  :args ((@c :isa curve)
         (@c1 :isa curve)
         (@c2 :isa curve)
         (@x :isa point)))

(def-eci vertex (predicate)
  :comment
  "When two linear curves `c1` and `c2` are joined at point `x` and do not
  constitute a straight line, the vertex `v` consists of the point and two
  sides, which are line segments or rays. Vertices are symmetric with respect
  to their sides `c1` and `c2`."
  :properties (:usc vertex)
  :args ((@v :isa point)
         (@c1 :isa linear-curve)
         (@c2 :isa linear-curve)
         (@x :isa point)))

(def-eci side-of (predicate)
  :comment
  "A line segment `c` is a side of a spatial entity `p` if there are vertices
  at its two endpoints that lie inside the spatial entity."
  :properties (:usc sideOf)
  :args ((@c :isa line-segment)
         (@p :isa spatial-entity)))

(def-eci polygon (predicate)
  :comment
  "A polygon `p` is a closed curve made up of `n` sides. For a polygon as a
  spatial region, rather than a one-dimensional curve, see `polygon2`."
  :properties (:usc polygon)
  :args ((@p :isa spatial-entity)
         (@n :isa positive-integer)))
