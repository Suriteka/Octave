//
//  DroneConnection.swift
//  Octave
//
//  Created by Jonathan Alpay on 07/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import DJISDK

class DroneConnection {
    let SSID = ""

    public static var connected:Bool = false
    public static var firmware:String = ""
    public static var model:String = ""
    
    /*
     * TryConnection
     * Trying to connect to the drone
     */
     func tryConnection() {
        guard let connectedKey = DJIProductKey(param: DJIParamConnection) else {
            NSLog("Error creating the connectedKey")
            return;
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            DJISDKManager.keyManager()?.startListeningForChanges(on: connectedKey, withListener: self, andUpdate: { (oldValue: DJIKeyedValue?, newValue : DJIKeyedValue?) in
                if let newVal = newValue {
                    if newVal.boolValue {
                        DispatchQueue.main.async {
                            self.productConnected()
                        }
                    }
                }
            })
            
            DJISDKManager.keyManager()?.getValueFor(connectedKey, withCompletion: { (value:DJIKeyedValue?, error:Error?) in
                if let unwrappedValue = value {
                    if unwrappedValue.boolValue {
                        // UI goes on MT.
                        DispatchQueue.main.async {
                            self.productConnected()
                        }
                    }
                }
            })
        }
        
    }
    
    /*
     * productConnected
     * Trying to connect to the drone
     */
    func productConnected() {
        guard let newProduct = DJISDKManager.product() else {
            print("Product is connected but DJISDKManager.product is nil -> something is wrong")
            return;
        }
        
        DroneConnection.connected = true
        
        if let model = newProduct.model {
            DroneConnection.model = model
            print("\(model) is connected")
            GimbalManager.shared.setup()
        }
        
        
        //Updates the product's firmware version - COMING SOON
        newProduct.getFirmwarePackageVersion{ (version:String?, error:Error?) -> Void in
            if let _ = error {
                print("Firmware Package Version: \(version ?? "Unknown")")
            }else{
                print("Firmware package version is: \(version ?? "Unknown")")
            }
            
            DroneConnection.firmware = "\(version ?? "Unknown")"
        }
    }
    
    /*
     * productDisconnected
     * Disconnect the connexion to the drone
     */
    func productDisconnected() {
        DroneConnection.connected = false
        print("Disconnected")
    }
}
