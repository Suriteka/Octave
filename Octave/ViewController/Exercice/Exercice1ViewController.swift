//
//  Exercice1ViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

class Exercice1ViewController: UIViewController {
    var scenario:Scenario!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scenario = Scenario(name: "exercice1")
        //scenario.play()
    }
    
    @IBAction func takeOff(_ sender: Any) {
        EventManager.instance.takeOff()
    }
    
    @IBAction func execute(_ sender: Any) {
        scenario.play()
    }
    
    @IBAction func landing(_ sender: Any) {
        EventManager.instance.landing()
    }
    
    @IBAction func stop(_ sender: Any) {
        MovingManager.instance.stop()
    }
    
}
