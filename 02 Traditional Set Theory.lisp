;; ECIpedia: Traditional Set Theory
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci set (collection)
  :comment
  "A set is a collection that is completely defined by its members."
  :properties (:usc set))

(def-eci null (set)
  :comment "The null set, which has no members."
  :properties (:usc null))

(def-eci eventualities (set)
  :comment "A set of eventualities."
  :properties (:usc eventualities))


;;
;; Relations
;;

(def-eci member (relation)
  :comment "x is a member of set s."
  :properties (:usc member)
  :args ((arg::x :isa abstraction)
         (arg::s :isa set))
  ;; Old draft definition:
  ;; A temporal sequence only has temporal entities as members.
  ;;   :const ((if (temporal-sequence arg::s)
  ;;               (temporal-entity arg::t)))
  )

(def-eci add-element (relation)
  :comment "Set s is obtained from set s1 by adding element x."
  :properties (:usc addElt)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::x :isa abstraction)))

(def-eci singleton (relation)
  :comment "Set s consists of a single element, x."
  :properties (:usc singleton)
  :args ((arg::s :isa set)
         (arg::x :isa abstraction)))

(def-eci doubleton (relation)
  :comment "Set s consists of two elements, x and y."
  :properties (:usc doubleton)
  :args ((arg::s :isa set)
         (arg::x :isa abstraction)
         (arg::y :isa abstraction)))

(def-eci delete-element (relation)
  :comment "Set s is obtained from set s1 by deleting x."
  :properties (:usc deleteElt)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::x :isa abstraction)))

(def-eci replace-element (relation)
  :comment "Set s is obtained from set s1 by replacing x with y."
  :properties (:usc replaceElt)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::x :isa abstraction)
         (arg::y :isa abstraction)))

(def-eci union (relation)
  :comment "Set s is the union of sets s1 and s2."
  :properties (:usc union)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci union3 (relation)
  :comment "Set s is the union of sets s1, s2, and s3."
  :properties (:usc union)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::s2 :isa set)
         (arg::s3 :isa set)))

(def-eci setdiff (relation)
  :comment "Set s is the set difference of s1 and s2."
  :properties (:usc setdiff)
  :args ((arg::s :isa set)
         (arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci subset (relation)
  :comment "Set s1 is a subset of set s2."
  :properties (:usc subset)
  :args ((arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci proper-subset (relation)
  :comment "Set s1 is a proper subset of set s2."
  :properties (:usc properSubset)
  :args ((arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci disjoint (relation)
  :comment "Sets s1 and s2 are disjoint; they have no members in common."
  :properties (:usc disjoint)
  :args ((arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci power-set (relation)
  :comment "Set s0 is the set of all subsets of set s."
  :properties (:usc powerSet)
  :args ((arg::s0 :isa set)
         (arg::s :isa set)))

(def-eci card (relation)
  :comment "n is the cardinality of set s."
  :properties (:usc card)
  :args ((arg::n :isa non-negative-integer)
         (arg::s :isa set)))


;;
;; Predicates
;;

(def-eci equal (predicate)
  :comment
  "x is equal to y. Equality is reflexive, symmetric, and transitive."
  :properties (:usc equal)
  :args ((arg::x :isa abstraction)
         (arg::y :isa abstraction)))

(def-eci nequal (predicate)
  :comment "x is not equal to y."
  :properties (:usc nequal)
  :args ((arg::x :isa abstraction)
         (arg::y :isa abstraction)))
