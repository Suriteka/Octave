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
    var scenarioArray:Array<JSON>
    
    /*
     * Init the scenario by passing the name of scenario
     */
    init(name: String) {
        let jsonFile = JSONManager.init(fileName: name)
        scenarioJSON = jsonFile.decode()
        scenarioArray = scenarioJSON.arrayValue
        
        sequenceJSON()
    }
    
    func sequenceJSON() {
        for sequence in scenarioArray {
            sequenceCreator(sequence: sequence)
        }
    }
    
    /* Convert the array from JSON to Drone */
    func sequenceCreator(sequence:JSON) {
        // Movement
        let duration = sequence["duration"].rawString()!
        let speed = sequence["duration"].rawString()!
        let actionsList:[Action] = []

        if !direction.isEmpty {
            let movement = movementCreator(direction: direction, duration: duration, speed: speed)
            MovingManager.instance.appendMouvement(mouvement: movement)
        }
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

    /* Create the action */
    func actionCreator(name: String) {

    }

    /* Play the scenario */
    func play() {
        MovingManager.instance.play()
    }
    
}
