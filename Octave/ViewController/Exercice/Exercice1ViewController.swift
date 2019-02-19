//
//  Exercice1ViewController.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit
import VideoPreviewer
import DJISDK

class Exercice1ViewController: UIViewController {
    var scenario:Scenario!

    var prev1 = VideoPreviewer()
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /* Setup Video */
        if let _ = DJISDKManager.product() {
            if let camera = self.getCamera(){
                camera.delegate = self
                self.setupVideoPreview()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let camera = self.getCamera() {
            camera.delegate = nil
        }
        self.resetVideoPreview()
    }
    
    @IBAction func takeOff(_ sender: Any) {
        EventManager.instance.takeOff()
    }
    
    @IBAction func execute(_ sender: Any) {
        scenario = Scenario(name: "exercice1")
        scenario.play()
        
        EventManager.instance.takePhotoFirstCallback = { () -> () in
            print("take picture first !")
            self.captureImage(view: self.imageView1)
        }
        
        EventManager.instance.takePhotoSecondCallback = { () -> () in
            print("take picture second !")
            self.captureImage(view: self.imageView2)
        }
    }

    
    @IBAction func stop(_ sender: Any) {
        MovingManager.instance.emergencyStop()
    }
    
    
    @IBAction func landing(_ sender: Any) {
      EventManager.instance.landing()
    }
    
    func resetVideoPreview() {
        prev1?.unSetView()
        DJISDKManager.videoFeeder()?.primaryVideoFeed.remove(self)
        
    }
    
    func getCamera() -> DJICamera? {
        // Check if it's an aircraft
        if let mySpark = DJISDKManager.product() as? DJIAircraft {
            return mySpark.camera
        }
        
        return nil
    }
    
    func captureImage(view: UIImageView){
        print("capture img function")
        self.prev1?.snapshotThumnnail { (image) in
            if let img = image {
                view.image = img
            }
        }
    }
    
    func setupVideoPreview() {
        print("setup video view")
        prev1?.setView(self.videoView)
        
        if let _ = DJISDKManager.product(){
            DJISDKManager.videoFeeder()?.primaryVideoFeed.add(self, with: nil)
        }
        
        prev1?.start()
    }
    
}


extension Exercice1ViewController:DJIVideoFeedListener {
    func videoFeed(_ videoFeed: DJIVideoFeed, didUpdateVideoData videoData: Data) {
        
        // SocketIOManager.shared.sendVideoData(data: videoData)
        
        videoData.withUnsafeBytes { (bytes:UnsafePointer<UInt8>) in
            prev1?.push(UnsafeMutablePointer(mutating: bytes), length: Int32(videoData.count))
        }
        
    }
}

extension Exercice1ViewController:DJISDKManagerDelegate {
    func appRegisteredWithError(_ error: Error?) {
        
    }
}

extension Exercice1ViewController:DJICameraDelegate {
    
}
