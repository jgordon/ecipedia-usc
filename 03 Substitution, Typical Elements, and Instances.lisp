;; ECIpedia: Substitution, Typical Elements, and Instances
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci nonspecific (abstraction)
  :comment
  "An entity that is a typical element of a set or functionally dependent
  on a typical element of a set is nonspecific."
  :properties (:usc nonspecific))

(def-eci specific (abstraction)
  :comment
  "An entity is specific iff it is not nonspecific."
  :properties (:usc specific))

;;
;; Relations
;;


;;
;; Predicates
;;

(def-eci subst (predicate)
  :comment
  "Two entities are substitutable in their respective events if they play
  the same role."
  :properties (:usc subst)
  :args ((arg::x :isa entity)
         (arg::e1 :isa eventuality)
         (arg::y :isa entity)
         (arg::e2 :isa eventuality)))

(def-eci subst2 (predicate)
  :comment
  "The pair <x1,x2> plays the same role in e1 that the pair <y1,y2> plays
  in e2."
  :properties (:usc subst2)
  :args ((arg::x1 :isa entity)
         (arg::x2 :isa entity)
         (arg::e1 :isa eventuality)
         (arg::y1 :isa entity)
         (arg::y2 :isa entity)
         (arg::e2 :isa eventuality)))

(def-eci typelt (predicate)
  :comment
  "x is a typical element of the set s. Real members of a set inherit all
  the properties of the typical element."
  :properties (:usc typelt)
  :args ((arg::x :isa entity)
         (arg::s :isa set)))

(def-eci dset (predicate)
  :comment
  "A defined set s with typical element x consists only of elements for
  which a particular property, eventuality e, really exists."
  :properties (:usc dset)
  :args ((arg::s :isa set)
         (arg::x :isa entity)
         (arg::e :isa eventuality)))

(def-eci no-subst-typelt (predicate)
  :comment
  "It is not the case that e1 is a typical element relation between x and
  some set s and y is a member of s; this blocks using 'subst' when e1 is
  a typical element property."
  :properties (:usc noSubstTypelt)
  :args ((arg::x :isa entity)
         (arg::e1 :isa eventuality)
         (arg::y :isa entity)
         (arg::e2 :isa eventuality)))

(def-eci not-subset-typelt (predicate)
  :comment
  "y is not a typical element of a subset of s."
  :properties (:usc notSubsetTypelt)
  :args ((arg::y :isa entity)
         (arg::s :isa set)))

(def-eci functional-dependency (predicate)
  :comment
  "y is functionally dependent on x by a function described by e.
  The principal property is that when e holds and a real entity instantiates
  x, then there is a real entity that instantiates y and the corresponding
  eventuality holds."
  :properties (:usc fd)
  :args ((arg::y :isa entity)
         (arg::x :isa entity)
         (arg::e :isa eventuality)))

(def-eci skolem-function (predicate)
  :comment
  "y1 is the value of the function corresponding to the functional
  dependency of y on x with respect to e when applied to x1."
  :properties (:usc skfct)
  :args ((arg::y1 :isa entity)
         (arg::y :isa entity)
         (arg::x1 :isa entity)
         (arg::x :isa entity)
         (arg::e :isa eventuality)))

(def-eci range-fd (predicate)
  :comment
  "s is the range of the values of the entity y that is functionally
  dependent on x with respect to e."
  :properties (:usc rangeFd)
  :args ((arg::s :isa set)
         (arg::y :isa entity)
         (arg::x :isa entity)
         (arg::e :isa eventuality)))

(def-eci parameters (predicate)
  :comment
  "s is the set of typical elements that appear somewhere in e as arguments."
  :properties (:usc parameters)
  :args ((arg::s :isa set)
         (arg::e :is eventuality)))

(def-eci partial-instance (predicate)
  :comment
  "e1 is a partial instantiation of an abstract eventuality e; nonspecific
  arguments are either instantiated or specialized."
  :properties (:usc partialInstance)
  :args ((arg::e1 :isa eventuality)
         (arg::e2 :isa eventuality)))

(def-eci pattern-instance (predicate)
  :comment
  "e1 is a complete instantiation of abstract eventuality e; all nonspecific
  arguments are instantiated."
  :properties (:usc patternInstance)
  :args ((arg::e1 :isa eventuality)
         (arg::e :isa eventuality)))

(def-eci holds-for (predicate)
  :comment
  "The eventuality type e1 holds for entity y; substituting y for a
  nonspecific argument x of e1 yields an eventuality that really exists."
  :properties (:usc holdsFor)
  :args ((arg::e1 :isa eventuality)
         (arg::y :isa entity)
         (arg::x :isa entity)))
