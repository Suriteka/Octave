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
    var scenarioJSONArray:Array<JSON>
    
    /*
     * Init the scenario by passing the name of scenario
     */
    init(name: String) {
        let jsonFile = JSONManager.init(fileName: name)
        scenarioJSON = jsonFile.decode()
        scenarioJSONArray = scenarioJSON.arrayValue
        sequenceJSON()
    }
    
    /* JSON to sequence */
    func sequenceJSON() {
        for sequence in scenarioJSONArray {
            JSONtoSequence(sequence:sequence)
        }
        
    }
    
    /* Play the scenario */
    func play() {
        SequenceManager.instance.play()
    }
    
    /* Convert JSON to Sequence */
    func JSONtoSequence(sequence:JSON) {
        let duration:CGFloat = CGFloat((sequence["duration"].rawString()! as NSString).doubleValue)
        var actionsList:[Action] = []
        
        for action in sequence["actions"].arrayValue {
            let actionType = action["actionType"].rawString()!
            let actionName = action["actionName"].rawString()!
            let speed:CGFloat = CGFloat((action["speed"].rawString()! as NSString).doubleValue)
            let myAction = actionCreator(actionType: actionType, actionName: actionName, speed: speed)
            actionsList.append(myAction)
        }
        
        let createdSequence = Sequence(duration: duration, sequenceList: actionsList)
        SequenceManager.instance.appendSequence(sequence: createdSequence)
    }
    
    /* Create actions in the sequence */
    func actionCreator(actionType:String, actionName:String, speed: CGFloat) -> Action {
        var action:Action = Action.sparkDirectionHorizontal(direction: .left, speed: speed)
        
        /* We are looking to the type of the action */
        switch actionType {
            
            /* Moving Horizontaly the drone */
            case ".sparkDirectionHorizontal":
                switch actionName {
                    case ".forward" :
                        action = Action.sparkDirectionHorizontal(direction: .forward, speed: speed)
                    case ".backward" :
                        action = Action.sparkDirectionHorizontal(direction: .backward, speed: speed)
                    case ".left" :
                        action = Action.sparkDirectionHorizontal(direction: .left, speed: speed)
                    case ".right" :
                        action = Action.sparkDirectionHorizontal(direction: .right, speed: speed)
                    case ".backwardRight" :
                        action = Action.sparkDirectionHorizontal(direction: .backwardRight, speed: speed)
                    case ".backwardLeft" :
                        action = Action.sparkDirectionHorizontal(direction: .backwardLeft, speed: speed)
                    case ".forwardRight" :
                        action = Action.sparkDirectionHorizontal(direction: .forwardRight, speed: speed)
                    case ".forwardLeft" :
                        action = Action.sparkDirectionHorizontal(direction: .forwardLeft, speed: speed)
                    default:
                        print("Unknown ActionName of sparkDirectionHorizontal in actionCreator function")
                }
            
            /* Moving vertically the drone */
            case ".sparkDirectionVertical":
                switch actionName {
                    case ".top" :
                        action = Action.sparkDirectionVertical(direction: .top, speed: speed)
                    case ".bottom" :
                        action = Action.sparkDirectionVertical(direction: .bottom, speed: speed)
                    default:
                        print("Unknown ActionName of sparkDirectionVertical in actionCreator function")
                }
            
            /* By default if the action is not ok */
            default:
                action = Action.sparkDirectionHorizontal(direction: .left, speed: speed)
        }
        
        return action
    }
}
