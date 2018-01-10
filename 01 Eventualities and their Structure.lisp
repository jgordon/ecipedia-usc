;; ECIpedia: Eventualities
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;; From Time.
;; Note: This should be covered more in Theory 1. We might have problems
;; defining it as a subclass of temporal-abstraction (as Mark suggested
;; doing to avoid repetition of the disjunction of temporal sequence,
;; temporal entity, or eventuality in the axioms below).
(def-eci eventuality (temporal-abstraction
                      positive-infinite-interval-or-eventuality
                      proper-interval-or-eventuality)
  :comment
  "An eventuality is a state or event. The duration of an eventuality is
  the duration of its time span."
  :properties (:usc eventuality)
  ;; TODO: Does this make 'happensIn' a mandatory argument? It shouldn't be.
  :args ((arg::happensIn :isa temporal-interval)))
