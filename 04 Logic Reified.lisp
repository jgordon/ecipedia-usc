;; ECIpedia: Logic Reified
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


;;
;; Abstractions
;;

;; Since these are abstractions, and thus *things*, we don't explicitly
;; include their primed eventuality arguments.

(def-eci and (eventuality logical-abstraction)
  :comment
  "The 'and' of two eventualities is itself an eventuality, and it exists
  when its two constituent eventualities exist."
  :properties (:usc and)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci not (eventuality logical-abstraction)
  :comment
  "The eventuality of the eventuality e2 not existing. The negation of an
  eventuality really exists if and only if the eventuality doesn't."
  :properties (:usc not)
  :args ((@e2 :isa eventuality)))

(def-eci nott (not)
  :comment
  "Stronger than 'not': The eventuality of nothing of e2's type existing."
  :properties (:usc nott)
  ;; Inherits @e2 from 'not'.
  )

(def-eci or (eventuality logical-abstraction)
  :comment
  "The eventuality of either e1 or e2 existing."
  :properties (:usc or)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci disjunction (eventuality logical-abstraction)
  :comment
  "The eventuality of some member of set s existing."
  :properties (:usc disjunction)
  :args ((@s :isa set)))

(def-eci imply (eventuality logical-abstraction)
  :comment
  "The eventuality of an implicational relation between e1 and e2 existing.
  Implication is transitive."
  :properties (:usc imply)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))


;;
;; Predicates
;;

(def-eci inconsistent (predicate)
  :comment
  "s1 and s2 are inconsistent sets of eventualities: One implies an
  eventuality and the other implies its negation."
  :properties (:usc inconsistent)
  :args ((@s1 :isa set)
         (@s2 :isa set)))

(def-eci minimally-proves (predicate)
  :comment
  "s1 proves e2 and no proper subset of s1 proves e2."
  :properties (:usc minimallyProves)
  :args ((@s1 :isa set)
         (@e2 :isa eventuality)))
