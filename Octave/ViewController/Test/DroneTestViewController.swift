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
        MovingManager.instance.restart()
        MovingManager.instance.appendMouvement(mouvement: Movement(direction: .top, duration: 3.0, speed: 3))
        MovingManager.instance.appendMouvement(mouvement: Movement(direction: .right, duration: 3.1, speed: 3))
        MovingManager.instance.appendMouvement(mouvement: Movement(direction: .top, duration: 5.2, speed: 4))
        MovingManager.instance.appendMouvement(mouvement: Movement(direction: .left, duration: 2.8, speed: 1))
        
        MovingManager.instance.play()
    }
    
    @IBAction func stop(_ sender: Any) {
        MovingManager.instance.restart()

        MovingManager.instance.appendMouvement(mouvement: Movement(direction: .stop, duration: 0.0, speed: 0))
        
        MovingManager.instance.play()
    }
    
    @IBAction func landing(_ sender: Any) {
        LandingManager.instance.landing()
    }
}
