;; ECIpedia: Composite Entities
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon


;;
;; Entities
;;

(def-eci composite-entity (entity)
  :comment
  "A composite entity is characterized by a set of components (see
  `components-of`), a set of properties (see `properties-of`), and a set of
  relations (See `relations-of`)."
  :properties (:usc compositeEntity))

(def-eci ground (composite-entity)
  :comment
  "A ground in a figure-ground relation is a composite entity whose parts
  are all uniform in that they all share some property."
  :properties (:usc ground))

(def-eci pattern (composite-entity)
  :comment
  "A pattern is a composite entity which contains type elements among
  its components."
  :properties (:usc pattern))


;;
;; Relations
;;

(def-eci at (relation)
  :comment
  "An entity `x` is at component `y` in composite entity `s`."
  :properties (:usc at)
  :args ((arg::x :isa entity)
         (arg::y :isa entity)
         (arg::s :isa ground)))


;;
;; Predicates
;;

(def-eci components-of (predicate)
  :comment
  "`s1` is the non-empty set of components of composite entity `x`."
  :properties (:usc componentsOf)
  :args ((arg::s1 :isa set)
         (arg::x :isa composite-entity)))

(def-eci component-or-whole (predicate)
  :comment
  "We define a predicate `component-or-whole` as the disjunction of
  `y` being a `component-of` `x` and `y` being `x` itself."
  :properties (:usc componentOrWhole)
  :args ((arg::y :isa entity)
         (arg::x :isa composite-entity)))

(def-eci component-of (component-or-whole)
  :comment
  "`y` is one of the components of composite entity `x`."
  :properties (:usc componentOf))

(def-eci aggregate (predicate)
  :comment
  "An aggregate of two entities (`x`) is a composite entity with those two
  entities (`y` and `z`) as its components."
  :properties (:usc aggregate)
  :args ((arg::x :isa composite-entity)
         (arg::y :isa entity)
         (arg::z :isa entity)))

(def-eci external-to (predicate)
  :comment
  "An entity `y` is external to a composite entity `x` if neither it nor
  any of its components is equal to `x` or one of `x`'s components."
  :properties (:usc externalTo)
  :args ((arg::y :isa entity)
         (arg::x :isa composite-entity)))

(def-eci onlyarg* (predicate)
  :comment
  "The predicate `onlyarg*` recurses through eventuality arguments and
  bottoms out in a single entity `y`."
  :properties (:usc onlyarg*)
  :args ((arg::y :isa entity)
         (arg::e :isa eventuality)))

(def-eci properties-of (predicate)
  :comment
  "`s2` is the set of properties of composite entity `x`."
  :properties (:usc propertiesOf)
  :args ((arg::s2 :isa set)
         (arg::x :isa composite-entity)))

(def-eci relations-of (predicate)
  :comment
  "The set `s3` of relations of a composite entity `x` are relations between
  a component or the whole, and something else."
  :properties (:usc relationsOf)
  :args ((arg::s3 :isa set)
         (arg::x :isa composite-entity)))

(def-eci property-or-relation-of (predicate)
  :comment
  "`e` is one of the properties or relations of composite entity `x`."
  :properties (:usc propOrRelOf)
  :args ((arg::e :isa eventuality)
         (arg::x :isa composite-entity)))

(def-eci relation-of (property-or-relation-of)
  :comment
  "A relation `e` is a relation of a composite entity `x` if it is in the
  `relations-of` set."
  :properties (:usc relationOf))

(def-eci pattern-parameters (predicate)
  :comment
  "The set `s` of parameters of a pattern `x` are the components that are
  type elements."
  :properties (:usc patternParameters)
  :args ((arg::s :isa set)
         (arg::x :isa pattern)))

(def-eci instance (predicate)
  :comment
  "An instance `x1` of a pattern `x` is a composite entity in which all
  parameters (see `pattern-parameters`) have been replaced by entities that
  are members of the set the parameter is the type element of."
  :properties (:usc instance)
  :args ((arg::x1 :isa composite-entity)
         (arg::x :isa pattern)))

(def-eci incomplete-instance (predicate)
  :comment
  "Composite entity `x1` is a partial instance of pattern `x` in which at
  least one parameters is instantiated and some but not all of the properties
  and relations are instantiated."
  :properties (:usc incompleteInstance)
  :args ((arg::x1 :isa composite-entity)
         (arg::x :isa pattern)))
