//
//  DroneGimbal.swift
//  Octave
//
//  Created by Jonathan Alpay on 07/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit
import DJISDK

public class GimbalManager {
    
    var gimbal: DJIGimbal?
    var front:Float = 90.0
    var under:Float = -90.0
    var defaultPitch: NSNumber = 0
    private var speed: TimeInterval?
    var ready = false
    
    static let shared = GimbalManager()
    
    func setup() {
        gimbal = getGimbal()
        
        gimbal?.setMode(DJIGimbalMode.free, withCompletion: { (err) in
            self.ready = true
        })
        
    }

    func executeGimbalRotation(action : ActionSparkGimbalRotation) {
        if ConfigManager.shared.config["debug"] == "true" {
            print("Gimball rotation to \(action.direction)")
        } else {
            
            switch action.direction {
                case .top: rotate(degrees: action.direction.value(), speed: action.speed)
                case .bottom: rotate(degrees: action.direction.value(), speed: action.speed)
            }
        }
    }
    
    private func getGimbal() -> DJIGimbal? {
        if let spark = DJISDKManager.product() as? DJIAircraft {
            if let gimbal = spark.gimbal {
                gimbal.delegate = self as? DJIGimbalDelegate
                
                return gimbal
            }
            
            return nil
        }
        
        return nil
    }
    
    
    func rotate(degrees: Float, speed: CGFloat) {
        
        let rotation = DJIGimbalRotation(pitchValue: NSNumber(value: degrees), rollValue: 0, yawValue: 0, time: TimeInterval(speed), mode: DJIGimbalRotationMode.relativeAngle)
        
        self.gimbal!.rotate(with: rotation, completion: { err in
            if err != nil {
                print("Error while rotating gimbal : \(String(describing: err))")
            }
        })
        
    }
    
    func resetGimbal(){
        self.gimbal!.reset { (err) in
            
        }
    }
}

