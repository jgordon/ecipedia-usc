;; ECIpedia: Arithmetic
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


(in-package :eci)


;;
;; Abstractions
;;

(def-eci number (abstraction)
  :comment "A number."
  :properties (:usc number))

(def-eci non-negative-integer (number)
  :comment
  "A non-negative integer. Zero (a constant) is a non-negative integer, and
  every non-negative integer has a non-negative integer as a `successor`."
  :properties (:usc nonNegInteger))

(def-eci positive-integer (non-negative-integer)
  :comment "A positive integer."
  :properties (:usc posInteger))

(def-eci non-negative-numeric-scale (vertical-scale)
  :comment
  "A scale whose elements are non-negative numbers, including 0, and whose
  partial ordering is `less-than`."
  :properties (:usc nonNegNumericScale))


;;
;; Predicates
;;

(def-eci successor (predicate)
  :comment
  "`n1` is the (unique) successor of `n`; `n1 = n+1`."
  :properties (:usc successor)
  :args ((@n1 :isa non-negative-integer)
         (@n :isa non-negative-integer)))

(def-eci sum (predicate)
  :comment
  "`n1` is the sum of `n2` and `n3`; `n1 = n2+n3`."
  :properties (:usc sum)
  :args ((@n1 :isa number)
         (@n2 :isa number)
         (@n3 :isa number)))

(def-eci product (predicate)
  :comment
  "`n1` is the product of `n2` and `n3`; `n1 = n2*n3`."
  :properties (:usc product)
  :args ((@n1 :isa number)
         (@n2 :isa number)
         (@n3 :isa number)))

(def-eci less-than-or-equal-to (predicate)
  :comment
  "`n1` is less than or equal to `n2`."
  :properties (:usc leq)
  :args ((@n1 :isa number)
         (@n2 :isa number)))

(def-eci less-than (less-than-or-equal-to)
  :comment
  "`n1` is less than `n2`; `n1 < n2`."
  :properties (:usc lt)
  :args ((@n1 :isa number)
         (@n2 :isa number)))

(def-eci greater-than-or-equal-to (predicate)
  :comment
  "`n1` is greater than or equal to `n2`."
  :properties (:usc geq)
  :args ((@n1 :isa number)
         (@n2 :isa number)))

(def-eci greater-than (greater-than-or-equal-to)
  :comment
  "`n1` is reater than `n2`; `n1 > n2`."
  :properties (:usc gt)
  :args ((@n1 :isa number)
         (@n2 :isa number)))

(def-eci fraction (predicate)
  :comment
  "`f` is the fraction whose number is `a` and whose denominator is `b`;
  `f = a/b`."
  :properties (:usc fraction)
  :args ((@f :isa number)
         (@a :isa non-negative-integer)
         (@b :isa positive-integer)))

(def-eci measure (predicate)
  :comment
  "`m` is a monotone increasing mapping from a scale `s` into a non-negative
  numeric scale, mapping the bottom of `s` into 0."
  :properties (:usc measure)
  :args ((@m)
         (@s :isa scale)))

(def-eci proportion (predicate)
  :comment
  "`f` is the proportion or ratio of `m(x)` to `m(y)`, where `m` is a measure
  on the scale containing `x` and `y`."
  :properties (:usc proportion)
  :args ((@f)
         (@x)
         (@y)
         (@m)))

(def-eci identity-function (predicate)
  :comment
  "`f` is the function that maps every element of `s` into itself."
  :properties (:usc identityFunction)
  :args ((@f)
         (@s)))

(def-eci same-half-order-of-magnitude (predicate)
  :comment
  "Two elements `x` and `y` of a scale `s1` are of the same half order of
  magnitude under measure `m`."
  :properties (:usc sameHOM)
  :args ((@x)
         (@y)
         (@s1)
         (@m)))
