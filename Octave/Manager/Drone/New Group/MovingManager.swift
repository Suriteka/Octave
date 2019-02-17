//
//  MovingManager.swift
//  SparkPerso
//
//  Created by AL on 11/01/2019.
//  Copyright © 2019 AlbanPerli. All rights reserved.
//

import UIKit
import DJISDK

// A moving Manager
class MovingManager {
    
    static let instance = MovingManager()
    
    func executeSparkDirectionHorizontal(action : ActionSparkDirectionHorizontal) {
        if ConfigManager.shared.config["debug"] == "true" {
            print("I'm doing \(action.direction) with a speed of \(action.speed)")
        } else {
            if let mySpark = DJISDKManager.product() as? DJIAircraft {
                switch action.direction {
                case .left,.right:
                    mySpark.mobileRemoteController?.rightStickVertical = 0.0
                    mySpark.mobileRemoteController?.rightStickHorizontal = Float(action.direction.value().x * action.speed)
                    
                case .forward,.backward:
                    mySpark.mobileRemoteController?.rightStickHorizontal = 0.0
                    mySpark.mobileRemoteController?.rightStickVertical = Float(action.direction.value().y * action.speed)
                    
                case .forwardLeft,.forwardRight, .backwardLeft, .backwardRight:
                    mySpark.mobileRemoteController?.rightStickHorizontal = Float(action.direction.value().x * action.speed)
                    mySpark.mobileRemoteController?.rightStickVertical = Float(action.direction.value().y * action.speed)
                    
                }
            }
        }
    }
    
    
    func executeSparkDirectionVertical(action : ActionSparkDirectionVertical) {
        switch action.direction {
        case .top,.bottom:
            print("I'm doing \(action.direction) with a speed of \(action.speed)")
            if let mySpark = DJISDKManager.product() as? DJIAircraft {
                mySpark.mobileRemoteController?.leftStickVertical = Float(action.direction.value() * action.speed)
            }
        }
    }
    
    /* Stop the drone */
    func stop() {
        print("*** Stop ***")
        SequenceManager.instance.restart()
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            mySpark.mobileRemoteController?.rightStickVertical = 0.0
            mySpark.mobileRemoteController?.rightStickHorizontal = 0.0
            mySpark.mobileRemoteController?.leftStickVertical = 0.0
            mySpark.mobileRemoteController?.leftStickHorizontal = 0.0
            
        }
    }
}
