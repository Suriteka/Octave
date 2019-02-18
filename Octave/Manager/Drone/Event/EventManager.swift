//
//  LandingManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import DJISDK

class EventManager {
    static let instance = EventManager()
    
    /* Photo shooting */
    var takePhotoFirstCallback:(()->())? = nil
    var takePhotoSecondCallback:(()->())? = nil
    
    /*
     * SparkEvent for Scenario
     */
    func executeSparkEvent(action: ActionSparkEvent) {
        switch action.event {
            case .landing: landing()
            case .takeOff: takeOff()
            case .stop: stop()
        }
    }
    
    /*
     * Event with a gimbal ! :)
     *
     */
    func executeGimbalEvent(action : ActionSparkGimbalEvent) {
        
        if ConfigManager.shared.config["debug"] == "true" {
            print(action.event)
            print("action")
        } else {
            switch action.event {
            case .takePictureFirst:
                print("send take picture callback to first !")
                self.takePhotoFirstCallback?()
            case .takePictureSecond:
                print("send take picture callback to second!")
                self.takePhotoSecondCallback?()
            }
        }
        
    }
    
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
    
    /*
     * Stop the drone if we want it
     */
    func stop() {
       MovingManager.instance.stop()
    }
}
