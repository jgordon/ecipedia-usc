;; ECIpedia: Scales
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


(in-package :eci)


;;
;; Abstractions
;;

(def-eci scale (set ground)
  :comment
  "A scale is a partially ordered set. A scale is potentially a ground,
  and very frequently we speak of entities being located at some point on
  a scale."
  :properties (:usc scale))

;; I've moved the existing ECI for "ordinal scale" to be subsumed by the
;; `scale`, above, which I believe is more general than this is intended to
;; be.
(def-eci ordinal-scale (scale)
  :comment "ECI definition for ORDINAL-SCALE.")

(def-eci function (abstraction)
  :comment "A function.")

(def-eci monotone-increasing-function (function)
  :comment
  "A monotone-increasing scale-to-scale function preserving the scales'
  \"less than\" ordering."
  :properties (:usc monotoneIncreasing))


;;
;; Relations
;;

(def-eci on-scale (relation)
  :comment
  "`x` is a point on scale `s` or at a point on `s`."
  :properties (:usc onScale)
  :args ((@x)
         (@s :isa scale)))

(def-eci top (relative-spatial-relation)
  :comment
  "`x` is the highest element in the scale `s`. It is the top of the
  `scale-hi-region`."
  :properties (:usc top)
  :args ((@x :isa entity)
         (@s :isa scale)))

(def-eci bottom (relative-spatial-relation)
  :comment
  "`x` is the lowest element in the scale `s`. It is the bottom of the
  `scale-lo-region`."
  :properties (:usc bottom)
  :args ((@x :isa entity)
         (@s :isa scale)))


;;
;; Predicates
;;

(def-eci partial-ordering (predicate)
  :comment
  "`e` is a partial ordering on the components of `s`, where `x` is less
  than `y`."
  :properties (:usc partialOrdering)
  :args ((@e :isa eventuality)
         (@x)
         (@y)
         (@s :isa scale)))

(def-eci total-ordering (partial-ordering)
  :comment
  "`e`, the partial ordering on the components of `s`, where `x` is less
  than `y`, is in fact total.  A total ordering is a partial ordering in
  which of any two elements, one is either less than, equal to, or greater
  than the other."
  :properties (:usc totalOrdering)
  :args ((@e :isa eventuality)
         (@x)
         (@y)
         (@s :isa scale)))

(def-eci in-scale (predicate)
  :comment
  "`y` is a component of the scale `s`."
  :properties (:usc inScale)
  :args ((@y)
         (@s :isa scale)))

(def-eci less-than-or-equal-on-scale (predicate)
  :comment
  "Component `x` is less than or equal to component `y` in the partial
  ordering for scale `s`."
  :properties (:usc leqs)
  :args ((@x)
         (@y)
         (@s :isa scale)))

(def-eci less-than-on-scale (less-than-or-equal-on-scale)
  :comment
  "Component `x` is less than component `y` in the partial ordering for
  scale `s`."
  :properties (:usc lts)
  :args ((@x)
         (@y)
         (@s :isa scale)))

(def-eci greater-than-or-equal-on-scale (predicate)
  :comment
  "Component `x` is greater than or equal to component `y` in the partial
  ordering for scale `s`."
  :properties (:usc gts)
  :args ((@x)
         (@y)
         (@s :isa scale)))

(def-eci greater-than-on-scale (greater-than-or-equal-on-scale)
  :comment
  "`x` is greater than `y` in the partial ordering for scale `s`."
  :properties (:usc gts)
  :args ((@x)
         (@y)
         (@s :isa scale)))

(def-eci subscale (predicate)
  :comment
  "`s1` is a subscale of scale `s`. A subscale of a scale has as its
  components a subset of the components of the scale and its partial
  ordering relation is the partial ordering of the scale restricted to
  that subset."
  :properties (:usc subscale)
  :args ((@s1 :isa scale)
         (@s :isa scale)))

(def-eci reverse (predicate)
  :comment
  "`s1` is the reverse of scale `s`. The reverse of a scale is one in
  which the partial ordering is reversed."
  :properties (:usc reverse)
  :args ((@s1 :isa scale)
         (@s :isa scale)))

(def-eci disjoint (predicate)
  :comment
  "The component sets of scales `s1` and `s2` are disjoint."
  :properties (:usc disjoint)
  :args ((@s1 :isa scale)
         (@s2 :isa scale)))

(def-eci function-onto (predicate)
  :comment
  "`f` is a function from a set or scale `s1` onto a set or scale `s2`.
  For a scale to be the domain or range of a function is for its set of
  components to be the domain or range."
  :properties (:usc function)
  :args ((@f :isa function)
         (@s1 :isa set)
         (@s2 :isa set)))

(def-eci function-into (predicate)
  :comment
  "`f` is a function from a set or scale `s1` into a set or scale `s2`."
  :properties (:usc functionInto)
  :args ((@f :isa function)
         (@s1 :isa set)
         (@s2 :isa set)))

(def-eci scale-defined-by (predicate)
  :comment
  "We define a scale by the set of its components and the relation that
  is the partial ordering of the scale. `s` is the scale with components
  `s1` and partial ordering defined by relation `e`."
  :properties (:usc scaleDefinedBy)
  :args ((@s :isa scale)
         (@s1 :isa set)
         (@e :isa eventuality)))

(def-eci subset-consistent (predicate)
  :comment
  "`s` is a scale whose ordering is consistent with the subset ordering
  among sets associated by the relation `e` with entities placed at points
  in `s`."
  :properties (:usc subsetConsistent)
  :args ((@s :isa scale)
         (@e)))

(def-eci composite-scale (predicate)
  :comment
  "Composite scale `s` has the same components as scales `s1` and `s2` and
  a partial ordering consistent with the partial orderings of `s1` and `s2`."
  :properties (:usc compositeScale)
  :args ((@s :isa scale)
         (@s1 :isa scale)
         (@s2 :isa scale)))

(def-eci scale-hi-region (predicate)
  :comment
  "`s1` is the high region of scale `s`."
  :properties (:usc Hi)
  :args ((@s1)
         (@s :isa scale)))

(def-eci scale-md-region (predicate)
  :comment
  "`s1` is the middle region of scale `s`."
  :properties (:usc Md)
  :args ((@s1)
         (@s :isa scale)))

(def-eci scale-lo-region (predicate)
  :comment
  "`s1` is the low region of scale `s`. If a point is in this region, it is
  less than all the points in the `scale-hi-region`."
  :properties (:usc Lo)
  :args ((@s1)
         (@s :isa scale)))

(def-eci scale-for (predicate)
  :comment
  "The property `e` corresponds to being in the `scale-hi-region` of scale
  `s`."
  :properties (:usc scaleFor)
  :args ((@s :isa scale)
         (@e)))
