;; ECIpedia: Time
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


;;
;; Abstractions
;;

(def-eci temporal-abstraction (abstraction)
  :comment "A temporal sequence, temporal entity, or eventuality.")

(def-eci time (temporal-abstraction)
  :comment "A temporal sequence or entity.")

(def-eci temporal-sequence (time)
  :comment
  "A temporal sequence is a set of non-overlapping temporal entities.
  Between any two distinct members of a temporal sequence, there is another
  interval or instant that is not in the set. A temporal sequence is also
  a scale whose ordering relation is `before`. The duration of a temporal
  sequence is the sum of the durations of its members."
  :properties (:usc tseq)
  ;; Old draft definition:
  ;;   :const ((all ((?t1 temporal-entity)
  ;;                 (?t2 temporal-entity))
  ;;             (if (and (member ?t1 s) (member ?t2 s))
  ;;                 (and (or (equal ?t1 ?t2) (before ?t1 ?t2)
  ;;                          (before ?t2 ?t1))
  ;;                      (if (before ?t1 ?t2)
  ;;                          (exists ((?t3 temporal-entity))
  ;;                            (and (not (member ?t3 s))
  ;;                                 (before ?t1 ?t3)
  ;;                                 (before ?t3 ?t2))))))))
  )

(def-eci roughly-periodic-temporal-sequence (temporal-sequence)
  :comment
  "A temporal sequence is roughly periodic if the gaps between successive
  elements are all the same half order of magnitude."
  :properties (:usc roughlyPeriodicTseq))

(def-eci periodic-temporal-sequence (roughly-periodic-temporal-sequence)
  :comment
  "A temporal sequence is periodic if that gaps between successive elements
  are all equal."
  :properties (:usc periodicTseq))

(def-eci temporal-entity (time)
  :comment
  "A temporal entity is an instant or an interval."
  :properties (:usc temporalEntity
               :owl time:TemporalEntity))

;; Note: Name 'time point' is already in use on ECIpedia, so we conform.
(def-eci time-point (temporal-entity)
  :comment
  "A time point is an instant of time. Its duration is zero."
  :properties (:usc instant
               :owl time:Instant))

;; Note: Name 'temporal region' is already in use on ECIpedia, so we
;; conform, including for derived names below.
(def-eci temporal-region (temporal-entity region)
  :comment
  "A temporal region is an interval of time."
  :properties (:usc interval
               :owl time:Interval))

(def-eci proper-temporal-region (temporal-region
                                 proper-temporal-region-or-eventuality)
  :comment
  "Proper temporal regions have distinct beginnings and ends. Positive
  infinite temporal regions are regarded as proper temporal regions."
  :properties (:usc properInterval))

(def-eci positive-infinite-temporal-region
    (proper-temporal-region
     positive-infinite-temporal-region-or-eventuality)
  :comment
  "A positive infinite temporal region has no end, and it may or may not
  have a beginning."
  :properties (:usc posInfInterval)
  ;; Old draft definition:
  ;;   :const ((not (exists ((?t2 time-point)) (ends t2 t))))
  )

;; Note: Name 'time unit' is already in use on ECIpedia, as a child of
;; `unit-type`, so we conform.
(def-eci time-unit (temporal-region unit-type)
  :comment
  "A temporal region that constitutes a standard unit, e.g., a second."
  :properties (:usc temporalUnit))

;; Note: Since only eventualities that have positive infinite time spans
;; belong in this class, I don't have eventuality inherit from it, which
;; would imply (as I understand it) that this applies to all eventualities.
(def-eci positive-infinite-temporal-region-or-eventuality
    (temporal-abstraction)
  :comment
  "Either a positive infinite temporal region or an eventuality whose time
  span is a positive infinite temporal region."
  :properties (:usc posInfIntervalEv)
  ;; Old draft definition:
  ;;   :const ((exists ((?t positive-infinite-interval))
  ;;             (time-span-of ?t e)))
  )

;; Note: For the same reason as above, I don't have eventuality inherit
;; from this ECI.
(def-eci proper-temporal-region-or-eventuality (temporal-abstraction)
  :comment
  "Either a proper temporal region or an eventuality whose time span is a
  proper temporal region. The beginning of a proper temporal region is
  before the instants inside, which are before the end."
  :properties (:usc properIntervalEv))

(def-eci time-scale (scale ground)
  :comment
  "A scale whose elements are temporal entities and whose ordering is
  `before`."
  :properties (:usc timeScale))

(def-eci scale-ordered-by-duration (scale)
  :comment
  "A scale whose elements are temporal regions ordered by duration."
  :properties (:usc scaleOrderedByDuration))

(def-eci frequent (abstraction)
  :comment
  "A set of eventualities in the high region of a rate scale."
  :properties (:usc frequent))


;;
;; Relations
;;

(def-eci begins (nontemporal-relation)
  :comment
  "Time point t1 is the beginning of temporal abstraction t2. The beginning
  of an time point is itself."
  :properties (:usc begins
               :owl time:hasBeginning)
  :args ((arg::t1 :isa time-point)
         (arg::t2 :isa temporal-abstraction))
  ;; Old draft definition:
  ;;   :const ((if (time-point arg::t2)
  ;;               (equal arg::t1 arg::t2))
  ;;           (if (temporal-sequence arg::t2)
  ;;               (exists ((?t temporal-entity))
  ;;                 (first ?t arg::t2)
  ;;                 (begins arg::t1 ?t)))
  ;;           (iff (eventuality arg::t2)
  ;;                (exists ((?t temporal-abstraction))
  ;;                  (and (time-span-of ?t arg::t2)
  ;;                       (begins arg::t1 ?t))))
  ;;           (all ((?t positive-infinite-interval))
  ;;                (if (inside-time ?t arg::t2)
  ;;                    (before arg::t1 ?t))))
  )

(def-eci ends (nontemporal-relation)
  :comment
  "Time point t1 is the end of temporal abstraction t2. The end of a time
  point is itself."
  :properties (:usc ends
               :owl time:hasEnd)
  :args ((arg::t1 :isa time-point)
         (arg::t2 :isa temporal-abstraction))
  ;; Old draft definition:
  ;;   :const ((if (time-point arg::t2)
  ;;               (equal arg::t1 arg::t2))
  ;;           (if (temporal-sequence arg::t2)
  ;;               (exists (?t)
  ;;                 (last ?t arg::t2)
  ;;                 (ends arg::t1 ?t)))
  ;;           (if (eventuality arg::t2)
  ;;               (exists (?t)
  ;;                 (time-span-of ?t arg::t2)
  ;;                 (ends arg::t1 ?t))))
  )


(def-eci inside-time (nontemporal-relation)
  :comment
  "Time point t1 is inside temporal abstraction t2."
  :properties (:usc insideTime
               :owl time:inside)
  :args ((arg::t1 :isa time-point)
         (arg::t2 :isa temporal-abstraction))
  ;; Old draft definition:
  ;;   :const ((if (temporal-sequence arg::t2)
  ;;               (and (not (begins arg::t1 arg::t2))
  ;;                    (not (ends arg::t1 arg::t2)))
  ;;               (exists ((?t temporal-abstraction))
  ;;                 (member ?t arg::t2)
  ;;                 (or (equal ?t arg::t1)
  ;;                     (inside-time arg::t1 ?t)
  ;;                     (begins arg::t1 ?t)
  ;;                     (ends arg::t1 ?t))))
  ;;           (if (eventuality arg::t2)
  ;;               (exists ((?t temporal-abstraction))
  ;;                 (time-span-of ?t arg::t2)
  ;;                 (inside-time arg::t1 ?t))))
  )

(def-eci temporal-region-between (nontemporal-relation)
  :comment
  "t is the temporal region that begins at temporal entity t1 and ends at
  temporal entity t2."
  :properties (:usc intervalBetween)
  :args ((arg::t :isa temporal-region)
         (arg::t1 :isa temporal-entity)
         (arg::t2 :isa temporal-entity))
  ;; Old draft definition:
  ;;   :const ((exists ((?t3 time-point)
  ;;                    (?t4 time-point))
  ;;             (ends ?t3 arg::t1)
  ;;             (begins ?t4 arg::t2)
  ;;             (begins ?t3 arg::t)
  ;;             (ends ?t4 arg::t)))
  )

(def-eci first (nontemporal-relation)
  :comment
  "If element t of the temporal sequence s is before all other
  elements of s, this is called the first element."
  :properties (:usc first)
  :args ((arg::t :isa temporal-entity)
         (arg::s :isa temporal-sequence))
  ;; Old draft definition:
  ;;   :const ((member arg::t arg::s)
  ;;           (all ((?t1 temporal-entity))
  ;;                (if (member ?t1 arg::s)
  ;;                    (or (equal ?t1 arg::t) (before arg::t ?t1)))))
  )

(def-eci last (nontemporal-relation)
  :comment
  "If element t of the temporal sequence s is after all other
  elements of s, this is called the last element."
  :properties (:usc last)
  :args ((arg::t :isa temporal-entity)
         (arg::s :isa temporal-sequence))
  ;; Old draft definition:
  ;; :const ((member arg::t arg::s)
  ;;         (all ((?t1 temporal-entity))
  ;;              (if (member ?t1 arg::s)
  ;;                  (or (equal ?t1 arg::t) (before ?t1 arg::t)))))
  )

(def-eci successive-elements (nontemporal-relation)
  :comment
  "Two elements of a temporal sequence are successive elements if
  there is no element between them."
  :properties (:usc successiveElts)
  :args ((arg::t1 :isa temporal-entity)
         (arg::t2 :isa temporal-entity)
         (arg::s :isa temporal-sequence))
  ;; Old draft definition:
  ;; :const ((member arg::t1 arg::s)
  ;;         (member arg::t2 arg::s)
  ;;         (before arg::t1 arg::t2)
  ;;         (not (exists ((?t temporal-entity))
  ;;                (member ?t arg::s)
  ;;                (before arg::t1 ?t)
  ;;                (before ?t arg::t2))))
  )

(def-eci convex-hull (nontemporal-relation)
  :comment
  "The convex hull of a temporal sequence is the smallest temporal region
  spanning all the members of the temporal sequence."
  :properties (:usc convexHull)
  :args ((arg::t :isa temporal-region)
         (arg::s :isa temporal-sequence))
  ;; Old draft definition:
  ;; :const ((all ((?t1 temporal-entity)
  ;;               (?t2 temporal-entity)
  ;;               (?t3 temporal-entity)
  ;;               (?t4 temporal-entity))
  ;;              (first ?t1 arg::s)
  ;;              (begins ?t3 ?t1)
  ;;              (last ?t2 arg::s)
  ;;              (ends ?t4 ?t2)
  ;;              (interval-between arg::t ?t3 ?t4)))
  )

(def-eci temporal-relation (relation)
  :comment
  "Temporal properties are ones that say something about when an eventuality
  occurs."
  :properties (:usc temporal))

(def-eci at-time (temporal-relation at)
  :comment
  "Eventuality e is occurring (i.e., really exists or obtains) at time
  point t."
  :properties (:usc atTime)
  :args ((arg::e :isa eventuality)
         (arg::t :isa time-point)))

(def-eci during (temporal-relation)
  :comment
  "Eventuality e is occurring (i.e., really exists or obtains) at every
   time point inside temporal region t."
  :properties (:usc during)
  :args ((arg::e :isa eventuality)
         (arg::t :isa proper-temporal-region))
  ;; Old draft definition:
  ;;   :const ((all ((?t1 temporal-entity))
  ;;                (if (inside-time ?t1 arg::t)
  ;;                    (at-time arg::e ?t1))))
  )

(def-eci time-span-of (temporal-relation)
  :comment
  "The 'time span of' an eventuality encompasses all the instants and
  temporal regions for which it really exists or obtains. The time span
  may be an instant, a temporal region, or a temporal sequence."
  :properties (:usc timeSpanOf)
  :args ((arg::t :isa time)
         (arg::e :isa eventuality))
  ;; Old draft definition:
  ;;   :const
  ;;   (or (and (instant arg::t) (at-time arg::e arg::t)
  ;;            (all ((?t1 temporal-abstraction))
  ;;                 (if (nequal ?t1 arg::t)
  ;;                     (not (at-time arg::e ?t1)))))
  ;;       (and (interval arg::t) (during arg::e arg::t)
  ;;            (all ((?t1 temporal-abstraction))
  ;;                 (if (at-time arg::e ?t1)
  ;;                     (or (inside-time ?t1 arg::t) (begins ?t1 arg::t)
  ;;                         (ends ?t1 arg::t)))))
  ;;       (and (temporal-sequence arg::t)
  ;;            (all ((?t1 temporal-abstraction))
  ;;                 (if (and (member ?t1 arg::t) (instant ?t1))
  ;;                     (at-time arg::e ?t1))
  ;;                 (if (and (member ?t1 arg::t) (interval ?t1))
  ;;                     (during arg::e ?t1))
  ;;                 (if (and (instant ?t1) (at-time arg::e ?t1))
  ;;                     (or (member ?t1 arg::t)
  ;;                         (exists ((?t2 temporal-abstraction))
  ;;                           (and (interval ?t2) (member ?t2 arg::t)
  ;;                                (or (begins ?t1 ?t2)
  ;;                                    (inside-time ?t1 ?t2)
  ;;                                    (ends ?t1 ?t2)))))))))
  )

(def-eci happens-in-time (temporal-relation)
  :comment
  "We will say that an eventuality e happens in a temporal entity or
  sequence t if its time span is entirely included in the temporal entity
  or sequence."
  :properties (:usc happensIn)
  :args ((arg::e :isa eventuality)
         (arg::t :isa time))
  ;; Old draft definition:
  ;;   :const
  ;;   (exists ((?t1 temporal-abstraction))
  ;;     (and (time-span-of ?t1 arg::e)
  ;;          (all ((?t2 temporal-abstraction))
  ;;               (if (or (begins ?t2 ?t1) (inside-time ?t2 ?t1)
  ;;                       (ends ?t2 ?t1))
  ;;                   (or (begins ?t2 arg::t) (inside-time ?t2 arg::t)
  ;;                       (ends ?t2 arg::t))))))
  )

(def-eci before (temporal-relation)
  :comment
  "t1 is before t2. The `before` relation is a partial ordering on the
  elements of a temporal sequence. The `before` relation is antireflexive,
  antisymmetric, and transitive."
  :properties (:usc before
               :owl time:before)
  :args (;(arg::e :isa eventuality)
         (arg::t1 :isa temporal-abstraction)
         (arg::t2 :isa temporal-abstraction))
  ;; Old draft definition:
  ;;   :const ((exists ((?s temporal-sequence))
  ;;             (partial-ordering arg::e arg::t1 arg::t2 ?s)
  ;;             (scale-defined-by ?s ?s arg::e))
  ;;           (not (equal arg::t1 arg::t2))
  ;;           (all ((?e1 eventuality))
  ;;                (not (before ?e1 arg::t2 arg::t1)))
  ;;           (all ((?e3 eventuality)
  ;;                 (?t3 temporal-abstraction))
  ;;                (if (before ?e3 arg::t2 ?t3)
  ;;                    (exists ((?e4 eventuality))
  ;;                      (before ?e4 arg::t1 ?t3)))))
  )

(def-eci duration-of (temporal-relation)
  :comment
  "The duration of t is d units u."
  :properties (:usc durationOf)
  :args ((arg::d :isa non-negative-integer)
         (arg::t :isa temporal-abstraction)
         (arg::u :isa time-unit)))

(def-eci nontemporal-relation (relation)
  :comment
  "A nontemporal relation is one that isn't temporal."
  :properties (:usc nontemporal))

(def-eci temporal-regions-meet (nontemporal-relation)
  :comment
  "Temporal region t1 meets temporal region t2. The end of one temporal
  region is the beginning of the other."
  :properties (:usc intMeets)
  :args ((arg::t1 :isa proper-temporal-region-or-eventuality)
         (arg::t2 :isa proper-temporal-region-or-eventuality)))

(def-eci temporal-regions-overlap (nontemporal-relation)
  :comment
  "Temporal regions t1 and t2 overlap. The beginning of one temporal region
  is inside the other."
  :properties (:usc intOverlaps)
  :args ((arg::t1 :isa proper-temporal-region-or-eventuality)
         (arg::t2 :isa proper-temporal-region-or-eventuality)))

(def-eci temporal-region-finishes-temporal-region (nontemporal-relation)
  :comment
  "Temporal region t1 begins inside temporal region t2, and their ends are
  the same."
  :properties (:usc intFinishes)
  :args ((arg::t1 :isa proper-temporal-region-or-eventuality)
         (arg::t2 :isa proper-temporal-region-or-eventuality)))

(def-eci temporal-region-during-temporal-region (nontemporal-relation)
  :comment
  "Temporal region t1 begins after and ends before temporal region t2."
  :properties (:usc intDuring)
  :args ((arg::t1 :isa proper-temporal-region-or-eventuality)
         (arg::t2 :isa proper-temporal-region-or-eventuality)))

(def-eci before-or-meets (nontemporal-relation)
  :comment
  "The end of t1 is before or equal to the beginning of t2."
  :properties (:usc beforeOrMeets)
  :args ((arg::t1 :isa temporal-entity)
         (arg::t2 :isa temporal-entity)))

(def-eci same-duration (nontemporal-relation)
  :comment
  "Temporal entities t1 and t2 have the same duration. This mostly applies
  to temporal regions, but trivially every time point is of the same
  duration, namely, zero. This relation is reflexive, symmetric, and
  transitive."
  :properties (:usc sameDuration)
  :args ((arg::t1 :isa temporal-entity)
         (arg::t2 :isa temporal-entity)))

(def-eci concatenation-of-temporal-regions (nontemporal-relation)
  :comment
  "Temporal region t is the concatenation of the temporal regions in the
  set s."
  :properties (:usc concatenation)
  :args ((arg::t :isa temporal-region)
         (arg::s :isa set)))

(def-eci shorter-duration (nontemporal-relation)
  :comment
  "Temporal region t1 has shorter duration than temporal region t2. This
  relation is a partial ordering."
  :properties (:usc shorterDuration)
  :args ((arg::t1 :isa temporal-region)
         (arg::t2 :isa temporal-region)))

(def-eci gap-duration (nontemporal-relation)
  :comment
  "d is the duration of the equal gaps in periodic temporal sequence s
  measured in units u."
  :properties (:usc gapDuration)
  :args ((arg::d :isa non-negative-integer)
         (arg::s :isa periodic-temporal-sequence)
         (arg::u :isa time-unit)))

(def-eci rate (nontemporal-relation)
  :comment
  "Eventualities in s occur n times in every element of t, if t is a set of
  temporal regions, or in every temporal region of duration t if t is a
  temporal unit."
  :properties (:usc rate)
  :args ((arg::n :isa number)
         (arg::s :isa set)
         ;; t is a set or temporal unit.
         (arg::t)))

(def-eci rate-scale (nontemporal-relation)
  :comment
  "s is a scale whose elements are the sets of eventualities in s0 and whose
  ordering is the rate of the sets."
  :properties (:usc rateScale)
  :args ((arg::s :isa scale)
         (arg::s0)))
