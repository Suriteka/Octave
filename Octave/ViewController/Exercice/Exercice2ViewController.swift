//
//  Exercice2ViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 19/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

class Exercice2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func takeOff(_ sender: Any) {
        EventManager.instance.takeOff()
    }
    
    
    @IBAction func scenarioRun(_ sender: Any) {
        let scenario = Scenario(name: "exercice2")
        scenario.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        MovingManager.instance.emergencyStop()
    }
    
    
    @IBAction func landing(_ sender: Any) {
        EventManager.instance.landing()
    }
}
