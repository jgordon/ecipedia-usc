;; ECIpedia: Persons
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Entities
;;

(def-eci person (agent physical-object)
  :comment
  "A person is a kind of agent and a kind of physical artifact. A person
  has a `body` and a `mind`."
  :properties (:usc person))


;;
;; Events
;;

;; Just to add the mapping to the USC predicate name.
(def-eci perceive (cognitive-state)
  :comment
  "The predicate `perceive` is a relation between an agent and an entity
  or eventuality external to the mind. Something being near a person is an
  enabling condition for perceiving it. When something is perceived, there
  is a sense organ whose intact-ness enables the perception."
  :properties (:usc perceive))


;;
;; Predicates
;;

(def-eci body (predicate)
  :comment
  "`b` is `p`'s body. The body is a physical object. A body is a composite
  entity whose components are body parts. In fact, it's a spatial system,
  since all the body parts are physical objects."
  :properties (:usc body)
  :args ((arg::b :isa physical-object)
         (arg::p :isa person)))

(def-eci mind (predicate)
  :comment
  "`m` is `p`'s mind. The mind is a composite entity."
  :properties (:usc mind)
  :args ((arg::m :isa composite-entity)
         (arg::p :isa person)))

(def-eci body-part (predicate)
  :comment
  "`x` is one of `p`'s body parts."
  :properties (:usc bodyPart)
  :args ((arg::x :isa entity)
         (arg::p :isa person)))

(def-eci body-parts-of (predicate)
  :comment
  "A person `p` has a set `s` of body parts, namely, the components of the
  body."
  :properties (:usc bodyPartsOf)
  :args ((arg::s :isa set)
         (arg::p :isa person)))

(def-eci sense-organ (body-part)
  :comment
  "`o` is one of `p`'s sense organs."
  :properties (:usc senseOrgan)
  :args ((arg::o :isa entity)
         (arg::p :isa person)))
