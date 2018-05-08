;; ECIpedia: Making Things: Frameworks and Coordinate Systems
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

(def-eci framework (abstraction)
  :comment
  "A framework has a set of entities we call its domain. The entities can
  participate in the `above2` and `right-of` spatial relations. Frameworks
  are often observer-based and hence volatile. E.g., moving around a table
  changes what counts as 'above' and 'right of'."
  :properties (:usc framework))

(def-eci coordinate-system (framework)
  :comment
  "A coordinate system is a framework in which all the axes are numeric and
  the partial ordering is 'greater than'."
  :properties (:usc coordinateSystem))


;;
;; Relations
;;

(def-eci above2 (spatial-relation)
  :comment
  "`y2` is above `y1` in framework `f` in the two-dimensional sense of being
  farther away from the observer."
  :properties (:usc above2)
  :args ((@y2)
         (@y1)
         (@f :isa framework)))

(def-eci above3 (spatial-relation)
  :comment
  "`y1` is above `y2` in framework `f` in the three-dimensional case, where
  'above' means farther away from the Earth. The relation `above3` is
  independent of `above2` and `rightOf`."
  :properties (:usc above3)
  :args ((@y1)
         (@y2)
         (@f :isa framework)))

(def-eci right-of (spatial-relation)
  :comment
  "`x1` is right of `x2` in framework `f`."
  :properties (:usc rightOf)
  :args ((@x1)
         (@x2)
         (@f :isa framework)))



;;
;; Predicates
;;

(def-eci independent-scales (predicate)
  :comment
  "Two scales `s1` and `s2` are independent if their components overlap and
  if you can't predict the relation between two elements on one scale from
  their relation on the other. That is, for some pairs of elements the order
  is preserved when we go from one scale to the other, and for some other
  pairs the order is reversed."
  :properties (:usc independentScales)
  :args ((@s1 :isa scale)
         (@s2 :isa scale)))

(def-eci horizontal2 (predicate)
  :comment
  "'Horizontal' in the two-dimensional case, where the y-axis is vertical."
  :properties (:usc horizontal2)
  :args ((@s :isa set)
         (@f :isa framework)))

(def-eci horizontal3 (predicate)
  :comment
  "'Horizontal' in the three-dimensional case, where the y-axis is
  horizontal. A subset of the domain is `horizontal3` if it is either
  `horizontal2` or `vertical3`. `horizontal3` and `vertical3` sets are
  independent scales."
  :properties (:usc horizontal3)
  :args ((@s :isa set)
         (@f :isa framework)))

(def-eci vertical2 (predicate)
  :comment
  "'Vertical' in the two-dimensional case."
  :properties (:usc vertical2)
  :args ())

(def-eci vertical3 (predicate)
  :comment
  "'Vertical' in the three-dimensional case. A subset of the domain is
  `vertical3` if no element of it is `above2` or `right-of` any other.
  `horizontal3` and `vertical3` sets are independent scales."
  :properties (:usc vertical3)
  :args ((@s1 :isa set)
         (@f :isa framework)))

(def-eci x-axis (predicate)
  :comment
  "Axis `a1` is the x-axis in framework `f` if it is `horizontal2`."
  :properties (:usc xAxis)
  :args ((@a1)
         (@f :isa framework)))

(def-eci y-axis (predicate)
  :comment
  "Axis `a2` is the y-axis in framework `f` if it is `vertical2`."
  :properties (:usc yAxis)
  :args ((@a2)
         (@f :isa framework)))

(def-eci z-axis (predicate)
  :comment
  "Axis `a3` is the z-axis in framework `f` if it is `vertical3`. The z-axis,
  if it exists, is unique and contains the `origin`."
  :properties (:usc zAxis)
  :args ((@a3)
         (@f :isa framework)))

(def-eci origin (predicate)
  :comment
  "The origin `o` is the element of framework `f` where the axes intersect."
  :properties (:usc origin)
  :args ((@o)
         (@f :isa framework)))

(def-eci x-coordinate (predicate)
  :comment
  "`x1` is the x-coordinate of element `x` of the domain of framework `f`
  if there is a vertical subset that contains both `x1` and `x`."
  :properties (:usc xCoordinate)
  :args ((@x1)
         (@x)
         (@f :isa framework)))

(def-eci y-coordinate (predicate)
  :comment
  "`y1` is the y-coordinate of element `x` of the domain of framework `f`
  if there is a horizontal subset that contains both `y1` and `x`."
  :properties (:usc yCoordinate)
  :args ((@y1)
         (@x)
         (@f :isa framework)))

(def-eci z-coordinate (predicate)
  :comment
  "`z1` is the z-coordinate of element `x` of the domain of framework `f`
  if there is a `vertical3` subset that contains both `z1` and `x`."
  :properties (:usc zCoordinate)
  :args ((@z1)
         (@x)
         (@f :isa framework)))

(def-eci 2D (predicate)
  :comment
  "Every framework has an x-axis and a y-axis. It is two-dimensional if and
  only if it lacks a z-axis. (`2D` is not exclusive to frameworks.)"
  :properties (:usc 2D)
  :args ((@f)))

(def-eci 3D (predicate)
  :comment
  "If a framework is three-dimensional, it has a z-axis."
  :properties (:usc 3D)
  :args ((@f)))
