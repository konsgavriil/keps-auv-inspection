(define (problem task)
(:domain auv_inspection)
(:objects
    auv - robot
    wp0 wp1 wp10 wp11 wp12 wp13 wp14 wp15 wp16 wp17 wp18 wp19 wp20 wp21 wp22 wp23 wp24 wp25 wp26 wp27 wp28 wp29 wp30  - point
    camera slam sonar rock_sensor - sensor
    arm - actuator
)
(:init
    (at auv wp0)

    (available auv)

    (hardware_stable auv)



    (rock_analyser_equipped auv rock_sensor)

    (slam_equipped auv slam)

    (sonar_equipped auv sonar)

    (arm_equipped auv arm)

    (surfpoint_at wp30)

    (connected wp0 wp10)
    (connected wp10 wp11)
    (connected wp11 wp12)
    (connected wp12 wp13)
    (connected wp13 wp14)
    (connected wp14 wp15)
    (connected wp15 wp16)
    (connected wp16 wp10)
    

    (connected wp10 wp0)
    (connected wp11 wp10)
    (connected wp12 wp11)
    (connected wp13 wp12)
    (connected wp14 wp13)
    (connected wp15 wp14)
    (connected wp16 wp15)
    (connected wp10 wp16)
    
    (connected wp0 wp27)
    (connected wp27 wp0)
    (connected wp27 wp26)
    (connected wp26 wp27)
    (connected wp26 wp25)
    (connected wp25 wp26)
    (connected wp25 wp20)
    (connected wp20 wp25)


    (localised auv)


    (structure_ob_point wp10)
    (structure_ob_point wp11)
    (structure_ob_point wp12)
    (structure_ob_point wp13)
    (structure_ob_point wp14)
    (structure_ob_point wp15)
    (structure_ob_point wp16)
    

    (free_point wp0)
    (free_point wp27)
    (free_point wp26)
    (free_point wp25)
    (free_point wp20)



    (= (battery_level auv) 15.6)

    (= (battery_min_theshold auv) 14)

    (= (battery_max_theshold auv) 15.9)

    (= (consumption auv) 0.01)

    (= (speed auv) 0.5)

    (= (distance wp10 wp11) 3.2)
    (= (distance wp11 wp12) 3.2)
    (= (distance wp12 wp13) 3.2)
    (= (distance wp13 wp14) 3.2)
    (= (distance wp14 wp15) 3.2)
    (= (distance wp15 wp16) 3.2)
    (= (distance wp16 wp10) 3.2)

    (= (distance wp0 wp10) 3.2)
    (= (distance wp10 wp0) 3.2)

    (= (distance wp11 wp10) 3.2)
    (= (distance wp12 wp11) 3.2)
    (= (distance wp13 wp12) 3.2)
    (= (distance wp14 wp13) 3.2)
    (= (distance wp15 wp14) 3.2)
    (= (distance wp16 wp15) 3.2)
    (= (distance wp10 wp16) 3.2)

    (= (distance wp0 wp27) 4)
    (= (distance wp27 wp0) 4)
    (= (distance wp27 wp26) 2.1)
    (= (distance wp26 wp27) 2.1)
    (= (distance wp26 wp25) 5)
    (= (distance wp25 wp26) 5)

    (= (distance wp25 wp20) 10)
    (= (distance wp20 wp25) 10)

   

    (= (total-distance) 0)

)
(:goal (and
    (point_mapped wp10)
    (point_mapped wp11)
    (point_mapped wp12)
    (point_mapped wp13)
    (point_mapped wp14)
    (point_mapped wp15)
    (point_mapped wp16)
    (rock_collected wp26)
    (valve_turned wp25)
    (recovered wp20)
))
)

