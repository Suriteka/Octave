//
//  MovingManager.swift
//  SparkPerso
//
//  Created by AL on 11/01/2019.
//  Copyright © 2019 AlbanPerli. All rights reserved.
//

import UIKit
import DJISDK

// Un manageur de Mouvement/Déplacement
// Qui liste les mouvements et permet de les afficher dans la console
class MovingManager {
    
    static let instance = MovingManager()
    var mouvements = [Movement]()
    
    func restart() {
        DirectionSequence.instance.content.removeAll()
        mouvements = []
    }
    
    func appendMouvement(mouvement:Movement) {
        DirectionSequence.instance.content.append(mouvement.description())
        mouvements.append(mouvement)
    }
    
    func play() {
        print("*** Playing sequence ***")
        executeMove()
    }
    
    func executeMove() {
        if let move = mouvements.first {
            // Ici Envoyer la direction au drone == Remplir les sticks
            if ConfigManager.shared.config["debug"] == "true" {
                print(move.description())
            } else {
                if let mySpark = DJISDKManager.product() as? DJIAircraft {
                    switch move.direction {
                        case .left,.right:
                            mySpark.mobileRemoteController?.rightStickVertical = 0.0
                            mySpark.mobileRemoteController?.rightStickHorizontal = Float(move.direction.value().x)
                        
                        case .top,.back:
                            mySpark.mobileRemoteController?.rightStickHorizontal = 0.0
                            mySpark.mobileRemoteController?.rightStickVertical = Float(move.direction.value().y)
                        
                        case .topLeft,.topRight, .bottomLeft, .bottomRight:
                            mySpark.mobileRemoteController?.rightStickHorizontal = Float(move.direction.value().x)
                            mySpark.mobileRemoteController?.rightStickVertical = Float(move.direction.value().y)
                        
                        case .stop:
                            mySpark.mobileRemoteController?.rightStickHorizontal = Float(0)
                            mySpark.mobileRemoteController?.rightStickVertical = Float(0)
                    }
                }
            }
          
            Timer.scheduledTimer(withTimeInterval: TimeInterval(move.duration), repeats: false) { (t) in
                // Code exécuté après move.duration seconds
                self.mouvements.remove(at: 0)
                self.executeMove()
            }
            
        } else {
            // Stop the drone
            MovingManager.instance.appendMouvement(mouvement: Movement(direction: .stop, duration: 0.0, speed: 0.0))
        }
    }
    
}
