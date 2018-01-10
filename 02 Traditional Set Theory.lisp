;; ECIpedia: Traditional Set Theory
;; Jerry Hobbs, Andrew Gordon, and Jonathan Gordon

(def-eci member (relation)
  :comment ""
  :properties (:hobbs member)
  :args ((arg::t :isa abstraction)
         (arg::s :isa abstraction))
  ;; Old draft definition:
  ;; A temporal sequence only has temporal entities as members.
  ;;   :const ((if (temporal-sequence arg::s)
  ;;               (temporal-entity arg::t)))
  )
