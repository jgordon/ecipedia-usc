;; ECIpedia: Eventualities and Their Structure
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

;; Note: We might have problems defining `eventuality` as a subclass of
;; temporal-abstraction (as Mark suggested doing to avoid repetition of
;; the disjunction of temporal sequence, temporal entity, or eventuality
;; in the Time axioms.
(def-eci eventuality (temporal-abstraction
                      positive-infinite-interval-or-eventuality
                      proper-interval-or-eventuality
                      eventuality-or-eventualities
                      eventuality-or-agent)
  :comment
  "An eventuality is a state or event. Eventualities all have a predicate,
  an arity, and arguments. The duration of an eventuality is the duration
  of its time span."
  :properties (:usc eventuality)
  ;; TODO: Does this make 'happensIn' a mandatory argument? It shouldn't be.
  :args ((arg::p :isa predicate)
         (arg::arity :isa non-negative-integer)
         (arg::args :isa set)
         (arg::happensIn :isa temporal-interval)))

(def-eci real-eventuality (eventuality)
  :comment
  "An eventuality that really exists in the real world."
  :properties (:usc Rexist))

(def-eci predicate (top-eci)
  :comment
  "A predicate used in logical formulas to define ECI semantics."
  :properties (:usc predicate))


;;
;; Predicates
;;

(def-eci gen (predicate)
  :comment
  "Eventuality e1 generates or entails the existence of eventuality e2.
  The 'gen' relation is between two eventualities, which are almost
  identical but not quite, e.g., the same event under different
  descriptions. The 'gen' relation is anti-reflexive. e1 and e2 occupy
  the same chunk of space-time."
  :properties (:usc gen)
  :args ((arg::e1 :isa eventuality)
         (arg::e2 :isa eventuality)))

(def-eci argn (predicate)
  :comment
  "x is the nth argument of e. Every eventuality is its own 0th argument."
  :properties (:usc argn)
  :args ((arg::x :isa abstraction)
         (arg::n :isa non-negative-integer)
         (arg::e :isa eventuality)))

(def-eci arg (predicate)
  :comment
  "x is an argument of e."
  :properties (:usc arg)
  :args ((arg::x :isa abstraction)
         (arg::e :isa eventuality)))

(def-eci arg* (predicate)
  :comment
  "An 'arg*' is something that is an argument of the eventuality or the
  argument of an argument of the eventuality or so on recursively."
  :properties (:usc arg*)
  :args ((arg::x :isa abstraction)
         (arg::e :isa eventuality)))

(def-eci pred (predicate)
  :comment
  "p is the predicate of eventuality e."
  :properties (:usc pred)
  :args ((arg::p :isa predicate)
         (arg::e :isa eventuality)))

(def-eci arity (predicate)
  :comment
  "n is the arity or the number of arguments of e."
  :properties (:usc arity)
  :args ((arg::n :isa non-negative-integer)
         (arg::e :isa eventuality)))
