;; ECIpedia: Making Things: Distance
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

;; This is in this file since its definition depends on distance.
(def-eci rhombus (quadrilateral)
  :comment
  "A rhombus is a quadrilateral whose sides are all equal."
  :properties (:usc rhombus))

(def-eci closed-curve (curve)
  :comment
  "A closed curve has no endpoints and can be covered by a large enough
  circle."
  :properties (:usc closed))


;;
;; Relations
;;

(def-eci near (relative-location)
  :comment
  "For `figure` to be `near` `ground` is to be on the `scale-lo-region` of
  the `nearness-scale` for `ground`."
  :properties (:usc near)
  :args ((@figure :isa physobj-or-region)
         (@ground :isa physobj-or-region)))

(def-eci far (relative-location)
  :comment
  "For `figure` to be `far` from `ground` is to be on the `scale-hi-region`
  of the `nearness-scale` for `ground`."
  :properties (:usc far)
  :args ((@figure :isa physobj-or-region)
         (@ground :isa physobj-or-region)))


;;
;; Predicates
;;

;; This replaces the definition from '14 Space.lisp'.
(def-eci distance (predicate)
  :comment
  "The distance between points `x1` and `x2` is `d` of unit `u`. The distance
  between an entity and itself is zero. The distance between two entities is
  symmetric, and the triangle inequality holds. "
  :properties (:usc distance)
  :args ((@d :isa non-negative-number)
         (@x1 :isa point)
         (@x2 :isa point)
         (@u :isa spatial-unit)))


(def-eci length (predicate)
  :comment
  "The length of a line segment is the distance between its endpoints."
  :properties (:usc length)
  :args ((@d :isa non-negative-number)
         (@c :isa line-segment)
         (@u :isa spatial-unit)))

;; This is in this file since its definition depends on distance.
(def-eci circle (predicate)
  :comment
  "A circle `c` around a center `x` is a figure in which every line segment
  from the center to a point inside the circle is constant."
  :properties (:usc circle)
  :args ((@c :isa curve)
         (@x :isa point)))

(def-eci nearer (predicate)
  :comment
  "`x` is nearer than `y` is to `z`."
  :properties (:usc nearer)
  :args ((@x :isa point)
         (@y :isa point)
         (@z :isa point)))

(def-eci nearness-scale (predicate)
  :comment
  "A scale whose partial ordering is `nearer`, relative to point `z`."
  :properties (:usc nearnessScale)
  :args ((@s :isa scale)
         (@z :isa point)))
