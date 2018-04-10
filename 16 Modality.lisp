;; ECIpedia: Modality
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci now (time-point)
  :comment
  "There is a time called 'now', which exists and is unique. For something
  to really exist is for it to happen or hold now."
  :properties (:usc Now))

(def-eci likelihood-scale (scale)
  :comment
  "A scale whose elements are likelihoods and whose partial ordering is
  the `lower-likelihood` relation."
  :properties (:usc likelihoodScale))


;;
;; Predicates
;;

(def-eci positive-modality (predicate)
  :comment
  "The positive modality `p` holds of eventuality `e`. (That is, `p` is a
  predicate, e.g., `real-eventuality` or `possibility`, that labels the
  modality.) The principal property of positive modalities is that Modus
  Ponens can be applied within the modality."
  :properties (:usc PosMod)
  :args ((@e :isa eventuality)
         (@p :isa predicate)))

(def-eci possible (predicate)
  :comment
  "An eventuality `e` is possible with respect to a set of constraints `c`
  iff the constraints do not imply a negation of the eventuality.
  Possibility is a positive modality. If an eventuality is `possible`, its
  negation is not `necessary`."
  :properties (:usc possible)
  :args ((@e :isa eventuality)
         (@c :isa eventualities)))

(def-eci necessary (predicate)
  :comment
  "An eventuality `e` is necessary with respect to a set of constraints `c`
  if the set of constraints implies it. Necessity is a positive modality
  because of the transitivity of `imply`."
  :properties (:usc necessary)
  :args ((@e :isa eventuality)
         (@c :isa eventualities)))

(def-eci impossible (predicate)
  :comment
  "An eventuality `e` is impossible with respect to a set of constraints `c`
  if it is not possible."
  :properties (:usc impossible)
  :args ((@e :isa eventuality)
         (@c :isa eventualities)))

(def-eci likelihood (predicate)
  :comment
  "`d` is the likelihood of `e` really existing, given constraints `c`.
  Likelihood is with respect to an implicit set of constraints that in a
  sense defines the sample space. Making the constraints an argument allows
  us to relate likelihood to possibility and to entailment."
  :properties (:usc likelihood)
  :args ((@d)
         (@e :isa eventuality)
         (@c :isa eventualities)))

(def-eci lower-likelihood (predicate)
  :comment
  "`d1` is a lower likelihood than `d2`."
  :properties (:usc lowerLikelihood)
  :args ((@d1)
         (@d2)))

(def-eci also-required (predicate)
  :comment
  "`s` is a set of eventualities which, when added to constraints `c`,
  entails `e`."
  :properties (:usc alsoRequired)
  :args ((@s :isa eventualities)
         (@e :isa eventuality)
         (@c :is eventualities)))

(def-eci more-likely (predicate)
  :comment
  "`e1` is more likely than `e2` given constraints `c`."
  :properties (:usc moreLikely)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)
         (@c :isa eventualities)))

(def-eci likely (predicate)
  :comment
  "`e` is likely, given constraints `c`. If an eventuality is likely, its
  negation is not."
  :properties (:usc likely)
  :args ((@e :isa eventuality)
         (@c :isa eventualities)))
