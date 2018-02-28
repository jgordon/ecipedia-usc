;; ECIpedia: Event Structure
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci event (eventuality)
  :comment
  "An event can (1) directly be a change of state, (2) generate
  a change of state, or (3) have a subevent, which contains the change."
  :properties (:usc event))


;;
;; Predicates
;;

(def-eci subevent (predicate)
  :comment
  "Event `e1` is a subevent of event `e2`. The `subevent` relation is
  antisymmetric (and thus also antireflexive). It is transitive."
  :properties (:usc subevent)
  :args ((arg::e1 :isa event)
         (arg::e2 :isa event)))

(def-eci event-sequence (predicate)
  :comment
  "Two events are in sequence if one is before the other, and the
  aggregate of the two events is just their reified conjunction.
  Event `e` is a sequence consisting of event `e1` followed by event `e2`.
  `e1` and `e2` are subevents of `e`."
  :properties (:usc eventSequence)
  :args ((arg::e :isa event)
         (arg::e1 :isa event)
         (arg::e2 :isa event)))

(def-eci conditional-event (predicate)
  :comment
  "`e` is the conditional event of event `e2` occurring if eventuality `e1`
  happens or holds. `e1` can be a state or an event and must obtain
  before the beginning of `e2`."
  :properties (:usc cond)
  :args ((arg::e :isa event)
         (arg::e1 :isa eventuality)
         (arg::e2 :isa event)))

(def-eci iteration (predicate)
  :comment
  "`e` is the event consisting of iterations of event type `e1`."
  :properties (:usc iteration)
  :args ((arg::e :isa event)
         (arg::e1 :isa event)))

(def-eci while-do (predicate)
  :comment
  "`e` is the event consisting of iterations of event `e2` as long as
  eventuality `e1` happens or holds."
  :properties (:usc whileDo)
  :args ((arg::e :isa event)
         (arg::e1 :isa event)
         (arg::e2 :isa event)))

(def-eci repeat-until (predicate)
  :comment
  "`e` is the event consisting of iterations of event type `e1` happening
  until `e2` happens or holds."
  :properties (:usc repeatUntil)
  :args ((arg::e :isa event)
         (arg::e1 :isa event)
         (arg::e2 :isa event)))

(def-eci for-all-of-seq (predicate)
  :comment
  "`e` is the event consisting of iterations of event type `e1` where in
  successive iterations the role of `x` is played by the successive members
  of sequence `s`."
  :properties (:usc forAllOfSeq)
  :args ((arg::e :isa event)
         (arg::s :isa sequence)
         (arg::x)
         (arg::e1 :isa event)))
