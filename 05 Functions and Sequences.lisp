;; ECIpedia: Functions and Sequences
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

;; Possibly this should be merged with the predicate ordered-pair-of, below,
;; which specifies the members of the pair. They are distinct in the axioms,
;; but that might not be the right treatment here.
(def-eci ordered-pair (collection sequence)
  :comment "An ordered pair of two elements."
  :properties (:usc pair0))

(def-eci sequence (abstraction)
  :comment
  "A sequence of length `n` is a function whose domain is the first `n`
  positive integers."
  :properties (:usc sequence))


;;
;; Relations
;;

(def-eci first (relation)
  :comment "`x` is the first element of a pair or sequence."
  :properties (:usc first)
  :args ((arg::x :isa entity)
         (arg::y :isa sequence)))

(def-eci second (relation)
  :comment "`y` is the second element of a pair."
  :properties (:usc second)
  :args ((arg::y :isa entity)
         (arg::p :isa ordered-pair)))

(def-eci nth (relation)
  :comment
  "`y` is the `i`th element of sequence `s` (i.e., the entity in the range
  of the function that `i` is mapped into)."
  :properties (:usc nth)
  :args ((arg::y :isa entity)
         (arg::i :isa non-negative-integer)
         (arg::s :isa sequence)))

(def-eci rest (relation)
  :comment "`s1` is the rest of the sequence `s` after the first element."
  :properties (:usc rest)
  :args ((arg::s1 :isa sequence)
         (arg::s :isa sequence)))

(def-eci last (relation)
  :comment "`y` is the last element of sequence `s`."
  :properties (:usc last)
  :args ((arg::y :isa entity)
         (arg::s :isa sequence)))

(def-eci in-sequence (relation)
  :comment "`y` is an element of the sequence `s`."
  :properties (:usc inSeq)
  :args ((arg::y :isa entity)
         (arg::s :isa sequence)))

(def-eci before-in-sequence (relation)
  :comment "`x` comes before `y` in the sequence `s`."
  :properties (:usc beforeInSeq)
  :args ((arg::x :isa entity)
         (arg::y :isa entity)
         (arg::s :isa sequence)))

(def-eci length (has-property)
  :comment
  "`n` is the length of the sequence `s`, i.e., the number that defines its
  domain of consecutive integers."
  :properties (:usc length)
  :args ((arg::n :isa non-negative-integer)
         (arg::s :isa sequence)))


;;
;; Predicates
;;

(def-eci ordered-pair-of (predicate)
  :comment "The ordered pair `p` consists of elements `<x, y>`."
  :properties (:usc pair)
  :args ((arg::p :isa ordered-pair)
         (arg::x :isa entity)
         (arg::y :isa entity)))

(def-eci function0 (predicate)
  :comment
  "A function `f` from set `s1` onto set `s2` is a set of pairs where each
  element of `s1` occurs exactly once as the first element in a pair and
  every element of `s2` occurs as a second element of at least one pair.
  (This is `function0` since it is later extended to functions from scales
  to scales.)"
  :properties (:usc function0)
  :args ((arg::f :isa abstraction)
         (arg::s1 :isa set)
         (arg::s2 :isa set)))

(def-eci domain (predicate)
  :comment "Set `s1` is the domain of function `f`."
  :properties (:usc domain)
  :args ((arg::s1 :isa set)
         (arg::f :isa abstraction)))

(def-eci range (predicate)
  :comment "Set `s2` is the range of function `f`."
  :properties (:usc range)
  :args ((arg::s2 :isa set)
         (arg::f :isa abstraction)))

(def-eci map (predicate)
  :comment
  "A function `f` maps an element `x` of the domain to an element `y` of the
  range if the pair `<x, y>` is a member of `f`."
  :properties (:usc map)
  :args ((arg::f :isa abstraction)
         (arg::x :isa set)
         (arg::y :isa set)))

(def-eci integers-in-range (predicate)
  :comment
  "`s` is the set of all positive integers from `n1` to `n2`, including `n1`
  and `n2`."
  :properties (:usc ints)
  :args ((arg::s :isa set)
         (arg::n1 :isa non-negative-integer)
         (arg::n2 :isa non-negative-integer)))
