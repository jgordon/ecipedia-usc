;; ECIpedia: Causality
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

;;
;; Abstractions
;;

(def-eci eventuality-or-eventualities (abstraction)
  :comment
  "An eventuality or a set of eventualities.")

(def-eci eventuality-or-agent (abstraction)
  :comment
  "An eventuality or an agent.")

(def-eci collective (set)
  :comment
  "A collective is a set of agents working together."
  :properties (:usc collective))


;;
;; Predicates
;;

(def-eci causal-complex (predicate)
  :comment
  "The eventuality or set of eventualities `c` is a causal complex for
  effect `e`. Each member of a causal complex is relevant: If it is removed
  from the set, the remainder is not a causal complex for the effect."
  :properties (:usc causalComplex)
  :args ((@c :isa eventuality-or-eventualities)
         (@e :isa eventuality)))

(def-eci cause0 (cause)
  :comment
  "Eventuality `e1` causes eventuality `e2`."
  :properties (:usc cause0)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci cause (tend-to-cause)
  :comment
  "Eventuality or agent `e1` causes eventuality `e2`. `cause` is like
  `cause0`, but it allows an agent as its first argument; when the first
  argument of `cause` is an eventuality, it reduces to `cause0`. When it's
  an agent, the agent's willing is the `cause0` of the second argument."
  :properties (:usc cause)
  :args ((@e1 :isa eventuality-or-agent)
         (@e2 :isa eventuality)))

(def-eci agent-of (predicate)
  :comment
  "Agent `a` is the agent or cause of eventuality `e`."
  :properties (:usc agentOf)
  :args ((@a :isa agent)
         (@e :isa eventuality)))

(def-eci do (predicate)
  :comment
  "Agent `a` does action `e` if and only if `a` is the agent of the action
  and the action really takes place."
  :properties (:usc do)
  :args ((@a :isa agent)
         (@e :isa eventuality)))

(def-eci object-of (predicate)
  :comment
  "The object of an action is the entity that goes through a change in
  the final stage of the causal chain."
  :properties (:usc objectOf)
  :args ((@x :isa patient) ;; Unclear what role this should be.
         (@e :isa eventuality)))

(def-eci instrument-of (predicate)
  :comment
  "An instrument is an entity that the agent causes to go through a
  change of state, where this change plays an intermediate role in the
  causal chain."
  :properties (:usc instrumentOf)
  :args ((@x :isa instrument)
         (@e :isa eventuality)))

(def-eci source-of (predicate)
  :comment
  "`e` is a change in a (real or metaphorical) `at` relation and `x` is
  the location of the initial `at` relation."
  :properties (:usc sourceOf)
  :args ((@x) ;; This is both initial-location and source in ECIpedia.
         (@e :isa eventuality)))

(def-eci terminus-of (predicate)
  :comment
  "`e` is a change in a (real or metaphorical) `at` relation and `x` is
  the location of the final `at` relation."
  :properties (:usc terminusOf)
  :args ((@x) ;; This is both final-location and goal in ECIpedia.
         (@e :isa eventuality)))

(def-eci causally-involved (predicate)
  :comment
  "An eventuality `e1` is causally involved in bringing about some
  effect `e2` if it is in some causal complex for `e2`."
  :properties (:usc causallyInvolved)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci enable0 (predicate)
  :comment
  "Eventuality `e1` is a member of a causal complex `s` for eventuality
  `e2` but not the cause of `e2`."
  :properties (:usc enable0)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)
         (@s :isa set)))

(def-eci enable (predicate)
  :comment
  "Eventuality `e1` is a member of every causal complex for eventuality
  `e2` but not the cause of `e2`. That is, `e1` is required for any way
  of bringing about `e2`."
  :properties (:usc enable)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci allow (predicate)
  :comment
  "Eventuality `e1` does not cause `(not e2)`."
  :properties (:usc allow)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci prevent (predicate)
  :comment
  "Eventuality `e1` causes `(not e2)`."
  :properties (:usc prevent)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci partially-cause (predicate)
  :comment
  "Eventuality `e1` together with something else causes eventuality `e2`."
  :properties (:usc partiallyCause)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci tend-to-cause (predicate)
  :comment
  "Eventuality `e1` tends to cause eventuality `e2`."
  :properties (:usc tcause)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)))

(def-eci tend-to-cause-with-likelihood (predicate)
  :comment
  "Eventuality `e1` tends to cause eventuality `e2` with likelihood `q`."
  :properties (:usc tcauseq)
  :args ((@e1 :isa eventuality)
         (@e2 :isa eventuality)
         (@q)))

(def-eci beyond-control-of-agent (predicate)
  :comment
  "`s1` is the subset of eventualities in `s` that are not under the
  control of agent `a`."
  :properties (:usc evsBeyondControl)
  :args ((@s1 :isa eventualities)
         (@s :isa eventualities)
         (@a :isa agent)))

(def-eci able (predicate)
  :comment
  "Agent `a` is able to do `e` under constraints `c`."
  :properties (:usc able)
  :args ((@a :isa agent)
         (@e)
         (@c :isa set)))

(def-eci ability (predicate)
  :comment
  "Ability `e1` is the state agent `a` being able to do `e` under
  constraints `c`."
  :properties (:usc ability)
  :args ((@e1)
         (@a :isa agent)
         (@e)
         (@c :isa set)))

(def-eci direct-cause (predicate)
  :comment
  "Eventuality or agent `e1` directly causes eventuality `e2` without
  any intermediate causes."
  :properties (:usc dcause)
  :args ((@e1 :isa eventuality-or-agent)
         (@e2 :isa eventuality)))

(def-eci enabled (predicate)
  :comment
  "All the enabling conditions for causal complex `s` resulting in
  eventuality `e` hold at time `t`."
  :properties (:usc enabled)
  :args ((@s)
         (@e :isa eventuality)
         (@t)))

(def-eci exectuable (predicate)
  :comment
  "Action `e` is executable by agent `a` under constraints `c`."
  :properties (:usc executable)
  :args ((@e)
         (@a :isa agent)
         (@c)))

(def-eci difficulties-with (predicate)
  :comment
  "`s` is the set of obstructions tending to prevent action `e` from being
  performed."
  :properties (:usc difficultiesWith)
  :args ((@s :isa set)
         (@e)))

(def-eci difficulty-scale (predicate)
  :comment
  "`s` is a scale for measuring the difficulty of actions of type `e`."
  :properties (:usc difficultyScale)
  :args ((@s :isa scale)
         (@e)))

(def-eci difficult (predicate)
  :comment
  "Action `e` is difficult for agent `a` because there are states and
  events, i.e., eventualities, that tend to cause the action not to happen."
  :properties (:usc difficult)
  :args ((@e)
         (@a :isa agent)))


;;
;; Roles
;;

(def-eci agent (role eventuality-or-agent)
  :comment
  "The chief property of agents is that they, defeasibly, are capable of
  causing some events."
  :properties (:usc agent))
