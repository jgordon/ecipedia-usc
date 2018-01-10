;; ECIpedia: Composite Entities
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

(def-eci ground (abstraction)
  :comment
  "An entity whose components are sufficiently similar for it to be a
  potential ground in an `at` relation.")


(def-eci at (relation)
  :comment
  "An entity x is at component y in composite entity s.")
