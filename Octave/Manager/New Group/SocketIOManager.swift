//
//  SocketIOManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 17/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager :NSObject {
    
    static let shared = SocketIOManager()
    
    var socket: SocketIOClient!
    let manager = SocketManager(socketURL: URL(string: ConfigManager.shared.config["serverUrl"].string ?? "")!, config: [.log(false), .compress, .forcePolling(true), .forceNew(true)])
    
    var didReceiveAllConnectedCallback:(()->())? = nil
    var didReceiveAllSendGyroCallback:((Data)->())? = nil
    var didReceiveAllVideoCallback:((Data)->())? = nil

    override init() {
        super.init()
        socket = manager.defaultSocket
    }
    
    func connectSocket() {
        print("CONNECTION")
        socket.on("connect") { _, _ in
            print("CONNECTED")

            self.socket.on("connectedDrone"){ (dataArray, ack) in
                self.didReceiveAllConnectedCallback?()
            }
            
            
            self.socket.on("toVideo"){ (dataArray, ack) in
                if let videoData = dataArray[0] as? Data {
                    print(videoData.count)
                    self.didReceiveAllVideoCallback?(videoData)
                }
            }
            
            self.socket.on("sendGyro"){ (dataArray, ack) in
                guard let dict = dataArray[0] as? [String: Any] else { return }
                print(dict)
                //print(dataArray[0].data(using: String.Encoding.utf8, allowLossyConversion: false))
               // self.didReceiveAllSendGyroCallback?(dataArray)
               // print(t)
            }
            
        }
        
        socket.connect()
        
    }
    
    func sendConnection() {
        self.socket.emit("dronePhone", false)
    }
    
    func sendMessage() {
        print("Send messages")
        self.socket.emit("", "")
    }
    
    func sendVideoData(data: Data) {
        self.socket.emit("video", data)
    }
}
