//
//  Scenario.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import SwiftyJSON

class Scenario {
    var scenarioJSON:JSON
    
    /*
     * Init the scenario by passing the name of scenario
     */
    init(name: String) {
        let jsonFile = JSONFileManager.init(fileName: name)
        scenarioJSON = jsonFile.decode()
        
        let scenarioArray = scenarioJSON.arrayValue
        
        scenarioArray.forEach { (sequence) in
            self.JSONSequencetoDrone(sequence: sequence)
        }

    }
    
    /* Convert the array from JSON to Drone */
    func JSONSequencetoDrone(sequence:JSON) {
        // Movement
        let direction = sequence["direction"].rawString()!
        let duration = sequence["duration"].rawString()!
        let speed = sequence["speed"].rawString()!

        let movement = movementCreator(direction: direction, duration: duration, speed: speed)

        MovingManager.instance.appendMouvement(mouvement: movement)

        // Action
        // There can be multiple actions (can be taken before or after the sequence)
        // Take a photo, changeGimball, landing, takeOff, ...
        let action = sequence["action"]
        let afterAction = sequence["afterAction"]
        let beforeAction = sequence["beforeAction"]
    }
    
    /* Create the movement */
    func movementCreator(direction:String, duration:String, speed:String) -> Movement {
        var movement:Movement
        
        let duration = CGFloat(Double(duration)!)
        let speed = CGFloat(Double(speed)!)

        switch direction {
        case "top":
            movement = Movement(direction: .top, duration: duration, speed: speed)
        case "back":
            movement = Movement(direction: .back, duration: duration, speed: speed)
        case "left":
            movement = Movement(direction: .left, duration: duration, speed: speed)
        case "right":
            movement = Movement(direction: .right, duration: duration, speed: speed)
        case "topRight":
            movement = Movement(direction: .topRight, duration: duration, speed: speed)
        case "bottomRight":
            movement = Movement(direction: .bottomRight, duration: duration, speed: speed)
        case "topLeft":
            movement = Movement(direction: .topLeft, duration: duration, speed: speed)
        case "bottomLeft":
            movement = Movement(direction: .bottomLeft, duration: duration, speed: speed)
        default:
            movement = Movement(direction: .stop, duration: 0.0, speed: speed)
        }

        return movement
    }
    
    /* Play the scenario */
    func play() {
        MovingManager.instance.play()
    }
    
}
