//
//  OctaveViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

class OctaveViewController: UIViewController {

    @IBOutlet weak var socketConnected: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        SocketIOManager.shared.sendConnection()
        
        SocketIOManager.shared.didReceiveAllConnectedCallback = { () -> () in
            self.socketConnected.text = "Socket : Connecté"
        }
        
        SocketIOManager.shared.didReceiveAllSendGyroCallback = { (data) -> () in
            let json = JSONManager.createFromData(data: data as! Data)
            print(json)
        }
    }
}
