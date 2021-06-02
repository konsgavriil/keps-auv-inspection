(define (domain auv_inspection)
(:requirements :strips :typing :fluents :negative-preconditions :disjunctive-preconditions :durative-actions :duration-inequalities :universal-preconditions )
(:types
  robot
  point
  sensor
  actuator
)
(:predicates (at ?r - robot ?wp - point)
             (available ?r - robot)
             (surfpoint_at_at ?r -robot ?wp - point)
             (rock_analyser_equipped ?r - robot ?s - sensor)
             (slam_equipped ?r - robot ?s - sensor)
             (sonar_equipped ?r - robot ?s - sensor)
             (arm_equipped ?r - robot ?a - actuator)
             (surfpoint_at ?wp - point)
             (connected ?wpi ?wpf - point)
             (localised ?r - robot)

             (communicated ?wp - point)
             (hardware_stable ?r - robot)
             (hardware_fixed ?wp - point)
             (explored ?wp - point)
             (recharged ?wp - point)
             (poi_inspected ?wp - point)
             (recovered ?wp - point)
             (point_mapped ?wp - point)
             (structure_ob_point ?wp - point)
             (free_point ?wp - point)

             (rock_collected ?wp - point)
             (valve_turned ?wp - point)
)
(:functions (battery_level ?r - robot)
            (battery_min_theshold ?r - robot)
            (battery_max_theshold ?r - robot)
            (consumption ?r - robot)
            (speed ?r - robot)
            (distance ?wpi ?wpf - point)
            (total-distance)
)

(:durative-action navigation
:parameters (?r - robot ?wpi  ?wpf - point)
:duration ( = ?duration (* (/ (distance ?wpi ?wpf) (speed ?r)) 2))
:condition (and
           (over all (connected ?wpi ?wpf))
           (over all (free_point ?wpf))
           (at start (available ?r))
           (at start (at ?r ?wpi))
           )
:effect (and
        (at start (not (available ?r)))
        (at start (not (at ?r ?wpi)))
        (at end (at ?r ?wpf))
        (at end (explored ?wpf))
        (at end (available ?r))
        (at end (increase (total-distance) (distance ?wpi ?wpf)))
        )
)

(:durative-action map
:parameters (?r - robot ?s - sensor ?wpi  ?wpf - point)
:duration ( = ?duration (* (/ (distance ?wpi ?wpf) (speed ?r)) 1.175))
:condition (and
           (over all (connected ?wpi ?wpf))
           (over all (structure_ob_point ?wpf))
           (over all (hardware_stable ?r))
           (over all (slam_equipped ?r ?s))
           (over all (localised ?r))
           (over all (> (battery_level ?r) (battery_min_theshold ?r)))
           (at start (available ?r))
           (at start (at ?r ?wpi))
           )
:effect (and
        (at start (not (available ?r)))
        (at start (not (at ?r ?wpi)))
        (at end (at ?r ?wpf))
        (at end (point_mapped ?wpf))
        (at end (available ?r))
        (at end (increase (total-distance) (distance ?wpi ?wpf)))
        )
)

(:durative-action communicate
:parameters (?r - robot  ?wp - point)
:duration (= ?duration 10)
:condition (and
           (over all (at ?r ?wp))
           (over all (surfpoint_at ?wp))
           (at start (available ?r))
           )
:effect (and
        (at start (not (available ?r)))
        (at end   (available ?r))
        (at end   (communicated ?wp))
        )
)

(:durative-action hardware-repair
:parameters (?r - robot  ?wp - point)
:duration (= ?duration 10)
:condition (and
           (over all (at ?r ?wp))
           (over all (surfpoint_at ?wp))
           (at start (communicated ?wp))
           (at start (available ?r))
           )
:effect (and
        (at start (not (available ?r)))
        (at end   (available ?r))
        (at end   (hardware_stable ?r))
        (at end   (hardware_fixed ?wp))
        )
)

(:durative-action recharge
:parameters (?r - robot  ?wp - point)
:duration (= ?duration 50)
:condition (and
           (over all (at ?r ?wp))
           (over all (hardware_stable ?r))
           (over all (surfpoint_at ?wp))
           (at start (communicated ?wp))
           (at start (available ?r))
           (at start (< (battery_level ?r) (battery_min_theshold ?r)))
           )
:effect (and
        (at start (not (available ?r)))
        (at start (assign (battery_level ?r) (battery_max_theshold ?r)))
        (at end   (available ?r))
        (at end   (recharged ?wp))
        (at end   (not (communicated ?wp)))
        )
)

(:durative-action recover
:parameters (?r - robot  ?wp - point)
:duration (= ?duration 1)
:condition (and
           (over all (at ?r ?wp))
           (over all (hardware_stable ?r))
           (at start (available ?r))
           )
:effect (and
        (at start (not (available ?r)))
        (at end   (not (available ?r)))
        (at end   (recovered ?wp))
        )
)

(:durative-action manipulation
:parameters (?r - robot ?wp - point ?a - actuator)
:duration ( = ?duration 5)
:condition (and
           (over all (at ?r ?wp))
           (over all (hardware_stable ?r))
           (over all (arm_equipped ?r ?a))
           (over all (localised ?r))
           (over all (> (battery_level ?r) (battery_min_theshold ?r)))
           (at start (available ?r))
           )
:effect (and
        (at start (not (available ?r)))
        (at end (valve_turned ?wp))
        (at end (available ?r))
        )

)

(:durative-action rock-inspection
:parameters (?r - robot ?wp - point ?s - sensor)
:duration ( = ?duration 4)
:condition (and
           (over all (at ?r ?wp))
           (over all (hardware_stable ?r))
           (over all (rock_analyser_equipped ?r ?s))
           (over all (localised ?r))
           (over all (> (battery_level ?r) (battery_min_theshold ?r)))
           (at start (available ?r))
           )
:effect (and
        (at start (not (available ?r)))
        (at end (rock_collected ?wp))
        (at end (available ?r))
        )

)

)

