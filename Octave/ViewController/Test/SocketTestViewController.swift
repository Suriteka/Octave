//
//  SocketViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 18/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//


import UIKit
import VideoPreviewer

class SocketTestViewController: UIViewController {
    
    @IBOutlet weak var videoViewer: UIView!

    let prev1 = VideoPreviewer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupVideoPreview()
//        
//        SocketIOManager.shared.didReceiveAllVideoCallback = { (data) -> () in
//            data.withUnsafeBytes { (bytes:UnsafePointer<UInt8>) in
//                self.prev1?.push(UnsafeMutablePointer(mutating: bytes), length: Int32(data.count))
//            }
//        }
        
    }

    func setupVideoPreview() {
        print("setup video view")
        prev1?.setView(self.videoViewer)
        prev1?.start()
    }
}
