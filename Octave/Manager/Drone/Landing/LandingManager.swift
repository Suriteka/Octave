//
//  LandingManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import DJISDK

class LandingManager {
    static let instance = LandingManager()

    /*
     * Landing the drone
     */
    func landing() {
        if ConfigManager.shared.config["debug"] == "true" {
            print("*** Landing ***")
        } else {
            if let mySpark = DJISDKManager.product() as? DJIAircraft {
                if let flightController = mySpark.flightController {
                    flightController.startLanding(completion: { (err) in
                        print(err.debugDescription)
                    })
                }
            }
        }
    }
    
    /*
     * takeOff the drone
     */
    func takeOff() {
        if ConfigManager.shared.config["debug"] == "true" {
            print("*** Take Off ***")
        } else {
            if let mySpark = DJISDKManager.product() as? DJIAircraft {
                if let flightController = mySpark.flightController {
                    flightController.startTakeoff(completion: { (err) in
                        print(err.debugDescription)
                    })
                }
            }
        }
    }
}
