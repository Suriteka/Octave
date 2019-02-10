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
    }
    
}
