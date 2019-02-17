//
//  DroneTestViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 07/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

class DroneTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func takeOff(_ sender: Any) {
        LandingManager.instance.takeOff()
    }
    
    @IBAction func scenario(_ sender: Any) {
     
    }
    
    @IBAction func stop(_ sender: Any) {
    
    }
    
    @IBAction func landing(_ sender: Any) {
        LandingManager.instance.landing()
    }
}
