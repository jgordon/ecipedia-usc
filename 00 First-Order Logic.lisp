;; ECIpedia: Basics
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

(def-eci if (predicate)
  :comment
  "Logical implication. If the antecedent is true, the consequent
  is true."
  :properties (:usc if)
  :args ((@antecedent :isa formula)
         (@consequent :isa formula))
  :const ((or (not @antecedent)
              @consequent)))


(def-eci iff (predicate)
  :comment
  "Bidirectional logical implication. The consequent is true if and only
  if the antecedent is true."
  :properties (:usc iff)
  :args ((@antecedent :isa formula)
         (@consequent :isa formula))
  :const (and (if @antecedent @consequent)
              (if @consequent @antecedent)))

