;; ECIpedia: Change of State
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


;;
;; Abstractions
;;

(def-eci vertical-scale (scale)
  :comment
  "A real or metaphorical vertical scale."
  :properties (:usc vertical))


;;
;; Predicates
;;

(def-eci change (predicate)
  :comment
  "There is a change from eventuality `e1` to eventuality `e2`. The
  eventualities involved in a change must involve some common entity.
  Change is defeasibly transitive. "
  :properties (:usc change)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci change-in (predicate)
  :comment
  "There is a change in some property of `x`."
  :properties (:usc changeIn)
  :args ((@x :isa entity)))

(def-eci change-from (predicate)
  :comment
  "There is a change out of eventuality `e1`."
  :properties (:usc changeFrom)
  :args ((@e1 :isa eventuality)))

(def-eci change-to (predicate)
  :comment
  "There is a change into eventuality `e2`."
  :properties (:usc changeTo)
  :args ((@e2 :isa eventuality)))

(def-eci move (predicate)
  :comment
  "An entity `x` moves from `y` to `z` exactly when there is a change from
  `x`'s being at `y` to its being at `z`."
  :properties (:usc move)
  :args ((@x :isa entity)
         (@y)
         (@z)))

(def-eci increase (predicate)
  :comment
  "If an entity `x` moves from a point on vertical scale `s` to a higher
  point, there has been an increase."
  :properties (:usc increase)
  :args ((@x :isa entity)
         (@s :isa vertical-scale)))

(def-eci decrease (predicate)
  :comment
  "If an entity `x` moves from a point on a vertical scale `s` to a
  lower point, there has been a decrease."
  :properties (:usc decrease)
  :args ((@x :isa entity)
         (@s :isa vertical-scale)))
