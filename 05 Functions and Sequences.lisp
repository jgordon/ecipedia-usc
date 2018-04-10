;; ECIpedia: Functions and Sequences
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

;; Possibly this should be merged with the predicate ordered-pair-of, below,
;; which specifies the members of the pair. They are distinct in the axioms,
;; but that might not be the right treatment here.
(def-eci ordered-pair (collection sequence composite-entity)
  :comment
  "An ordered pair of two elements. Ordered pairs are composite entities
  where the components are the first and second elements, there are no
  properties other than the whole being a pair, and the relations are the
  `first` and `second` relations between the components and the whole."
  :properties (:usc pair0))

(def-eci sequence (abstraction composite-entity scale)
  :comment
  "A sequence of length `n` is a function whose domain is the first `n`
  positive integers. A sequence can be viewed as a composite entity whose
  components are the elements of the sequence and whose relations are the
  ordering relations in the sequence. Thus a sequence is also a scale, whose
  partial ordering is the `before-in-sequence` relation."
  :properties (:usc sequence))


;;
;; Relations
;;

(def-eci first (relation)
  :comment "`x` is the first element of a pair or sequence."
  :properties (:usc first)
  :args ((@x :isa entity)
         (@y :isa sequence)))

(def-eci second (relation)
  :comment "`y` is the second element of a pair."
  :properties (:usc second)
  :args ((@y :isa entity)
         (@p :isa ordered-pair)))

(def-eci nth (relation)
  :comment
  "`y` is the `i`th element of sequence `s` (i.e., the entity in the range
  of the function that `i` is mapped into)."
  :properties (:usc nth)
  :args ((@y :isa entity)
         (@i :isa non-negative-integer)
         (@s :isa sequence)))

(def-eci rest (relation)
  :comment "`s1` is the rest of the sequence `s` after the first element."
  :properties (:usc rest)
  :args ((@s1 :isa sequence)
         (@s :isa sequence)))

(def-eci last (relation)
  :comment "`y` is the last element of sequence `s`."
  :properties (:usc last)
  :args ((@y :isa entity)
         (@s :isa sequence)))

(def-eci in-sequence (relation)
  :comment "`y` is an element of the sequence `s`."
  :properties (:usc inSeq)
  :args ((@y :isa entity)
         (@s :isa sequence)))

(def-eci before-in-sequence (relation)
  :comment "`x` comes before `y` in the sequence `s`."
  :properties (:usc beforeInSeq)
  :args ((@x :isa entity)
         (@y :isa entity)
         (@s :isa sequence)))

(def-eci length (has-property)
  :comment
  "`n` is the length of the sequence `s`, i.e., the number that defines its
  domain of consecutive integers."
  :properties (:usc length)
  :args ((@n :isa non-negative-integer)
         (@s :isa sequence)))


;;
;; Predicates
;;

(def-eci ordered-pair-of (predicate)
  :comment "The ordered pair `p` consists of elements `<x, y>`."
  :properties (:usc pair)
  :args ((@p :isa ordered-pair)
         (@x :isa entity)
         (@y :isa entity)))

(def-eci function0 (predicate)
  :comment
  "A function `f` from set `s1` onto set `s2` is a set of pairs where each
  element of `s1` occurs exactly once as the first element in a pair and
  every element of `s2` occurs as a second element of at least one pair.
  (This is `function0` since it is later extended to functions from scales
  to scales.)"
  :properties (:usc function0)
  :args ((@f :isa abstraction)
         (@s1 :isa set)
         (@s2 :isa set)))

(def-eci domain (predicate)
  :comment "Set `s1` is the domain of function `f`."
  :properties (:usc domain)
  :args ((@s1 :isa set)
         (@f :isa abstraction)))

(def-eci range (predicate)
  :comment "Set `s2` is the range of function `f`."
  :properties (:usc range)
  :args ((@s2 :isa set)
         (@f :isa abstraction)))

(def-eci map (predicate)
  :comment
  "A function `f` maps an element `x` of the domain to an element `y` of the
  range if the pair `<x, y>` is a member of `f`."
  :properties (:usc map)
  :args ((@f :isa abstraction)
         (@x :isa set)
         (@y :isa set)))

(def-eci integers-in-range (predicate)
  :comment
  "`s` is the set of all positive integers from `n1` to `n2`, including `n1`
  and `n2`."
  :properties (:usc ints)
  :args ((@s :isa set)
         (@n1 :isa non-negative-integer)
         (@n2 :isa non-negative-integer)))
