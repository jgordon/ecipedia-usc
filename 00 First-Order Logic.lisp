;; ECIpedia: Basics
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

(def-eci if (logical-abstraction)
  :comment
  "Logical implication. If the antecedent is true, the consequent
  is true."
  :properties (:usc if)
  :args ((arg::antecedent :isa formula)
         (arg::consequent :isa formula))
  :const ((or (not arg::antecedent)
              arg::consequent)))


(def-eci iff (logical-abstraction)
  :comment
  "Bidirectional logical implication. The consequent is true if and only
  if the antecedent is true."
  :properties (:usc iff)
  :args ((arg::antecedent :isa formula)
         (arg::consequent :isa formula))
  :const (and (if arg::antecedent arg::consequent)
              (if arg::consequent arg::antecedent)))

