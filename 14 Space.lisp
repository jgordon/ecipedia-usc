;; ECIpedia: Space
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci spatial-unit (unit-type)
  :comment
  "A spatial unit."
  :properties (:usc spatialUnit))


;;
;; Entities
;;

(def-eci physical-object (entity)
  :comment
  "A physical object."
  :properties (:usc physobj))

(def-eci spatial-system (composite-entity ground)
  :comment
  "A spatial system is a composite entity whose components are physical
  objects related by distance. A spatial system is a possible ground by
  virtue of the fact that all its components are physical objects."
  :properties (:usc spatialSystem))


;;
;; Predicates
;;

(def-eci distance (predicate)
  :comment
  "`d` is the distance in units `u` between `x1` and `x2` in spatial
  system `s`. The distance between an entity and itself is zero. The
  distance between two entities is symmetric, and the triangle inequality
  holds."
  :properties (:usc distance)
  :args ((arg::d :isa non-negative-integer)
         (arg::u :isa spatial-unit)
         (arg::x1 :isa entity)
         (arg::x2 :isa entity)
         (arg::s :isa spatial-system)))

(def-eci shorter-distance (predicate)
  :comment
  "`d1` and `d2` are distances between components of spatial system `s`,
  and `d1` is less than `d2`."
  :properties (:usc shorterDistance)
  :args ((arg::d1 :isa number)
         (arg::d2 :isa number)
         (arg::s :isa spatial-system)))

(def-eci nearness-scale (predicate)
  :comment
  "`s1` is a scale whose components are distances between pairs of entities
  in spatial system `s`."
  :properties (:usc nearnessScale)
  :args ((arg::s1 :isa scale)
         (arg::s :isa spatial-system)))


;;
;; Relations
;;

(def-eci near (relative-location near-to)
  :comment
  "`x1` is near `x2` in spatial system `s`; the distance between them is in
  the `scale-hi-region` of a `nearness-scale`."
  :properties (:usc near)
  :args ((arg::x1 :isa entity)
         (arg::x2 :isa entity)
         (arg::s :isa spatial-system)))

;; Renaming `at` from ECIpedia.
(def-eci at-location (relative-spatial-relation at)
  :comment
  "`x` is at `y` in spatial system `s`."
  :properties (:usc atLoc)
  :args ((arg::x :isa entity)
         (arg::y :isa entity)
         (arg::s :isa spatial-system)))
