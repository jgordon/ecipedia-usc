;; ECIpedia: Making Things: Polyhedrons
;; Jerry Hobbs and Jonathan Gordon

(in-package :eci)


;;
;; Abstractions
;;

(def-eci polyhedron (volume)
  :comment
  "A polyhedron is a volume with a set `s` of faces, which are polygons
  contained within and accounting for the entirety of the surface of the
  polyhedron, overlapping only at their boundaries."
  :properties (:usc polyhedron)
  :args (;(@p :isa volume)
         (@s :isa set)))

(def-eci 2d-polyhedron (2d-region)
  :comment
  "The 2-dimensional surface of a 3-dimensional `polyhedron` with the set
  of faces `s`."
  :properties (:usc polyhedron2)
  :args (;(@p2 :isa 2d-region)
         (@s :isa set)))

(def-eci rectangular-parallelepiped (polyhedron)
  :comment
  "A rectangular parallelepiped is a polyhedron all of whose faces are
  rectangles."
  :properties (:usc rectangularParallelepiped)
  :args (;(@p :isa volume)
         (@s :isa set)))

(def-eci cube (rectangular-parallelepiped)
  :comment
  "A cube is a polyhedron all of whose faces are squares."
  :properties (:usc cube)
  :args (;(@p :isa volume)
         (@s :isa set)))

(def-eci sphere (volume)
  :comment
  "A sphere around a center `x` is a volume in which every line segment
  from the center to a point inside the surface is constant."
  :properties (:usc sphere)
  :args (;(@p :isa sphere)
         (@x :isa point)))

(def-eci convex-volume (volume)
  :comment
  "A volume is convex if every point on a line segment between any two
  points on its surface is inside the volume."
  :properties (:usc convex))

(def-eci concave-volume (volume)
  :comment
  "A volume is concave if it is not a `convex-volume`."
  :properties (:usc concave))


;;
;; Predicates
;;

(def-eci face (predicate)
  :comment
  "A face of a polyhedron is one of the faces."
  :properties (:usc face)
  :args ((@f)
         (@p :isa volume)))

(def-eci edge (predicate)
  :comment
  "An edge of a polyhedron is a side of one of the faces."
  :properties (:usc edge)
  :args ((@c :isa line-segment)
         (@p :isa volume)))

(def-eci 3d-vertex (predicate)
  :comment
  "The vertex of a 3-dimensional entity. A vertex of a polyhedron is an
  endpoint of one of the edges."
  :properties (:usc vertex3)
  :args ((@x :isa point)
         (@p :isa volume)))
