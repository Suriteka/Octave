//
//  MainViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 07/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // Variables
    var droneConnection:DroneConnection = DroneConnection()

    // UI Component
    @IBOutlet weak var droneStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func connectToDrone(_ sender: Any) {
        print("Connection")
        droneConnection.tryConnection()
        droneStatus.text = "Connecté: \(DroneConnection.connected), \(DroneConnection.model) \(DroneConnection.firmware)"
    }
}
