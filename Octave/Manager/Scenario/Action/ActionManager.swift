//
//  ActionManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import DJISDK

/* Action Manager, that take an action, and execute it */
class ActionManager {
    static let instance = ActionManager()
    
    func executeAction(action : Action) {
        print("execute action")
        switch action.getActionType() {
            /* If the action is to move horizontaly (left, right, ...), let's execute it */
            case ".sparkDirectionHorizontal":
                MovingManager.instance.executeSparkDirectionHorizontal(action: action.actionValues as! ActionSparkDirectionHorizontal)

            /* If the action is to move verticaly (top-bottom), let's execute it */
            case ".sparkDirectionVertical":
                MovingManager.instance.executeSparkDirectionVertical(action: action.actionValues as! ActionSparkDirectionVertical)

            case ".sparkEvent":
                EventManager.instance.executeSparkEvent(action: action.actionValues as! ActionSparkEvent)
            
            case ".sparkRotation":
                MovingManager.instance.executeSparkRotation(action: action.actionValues as! ActionSparkRotation)

            case ".sparkGimbalRotation":
                GimbalManager.shared.executeGimbalRotation(action: action.actionValues as! ActionSparkGimbalRotation)
            
            case ".sparkGimbalEvent":
                EventManager.instance.executeGimbalEvent(action: action.actionValues as! ActionSparkGimbalEvent)
            
            default:
                print("I don't know this type of action")
        }
    }
    
}
