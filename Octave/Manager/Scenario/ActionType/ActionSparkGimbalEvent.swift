//
//  ActionGimbalEvent.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation

struct ActionSparkGimbalEvent{
    var event: Event
    
    public enum Event:String, CaseIterable {
        case takePictureFirst, takePictureSecond
        
        func value() -> String {
            switch self {
                case .takePictureFirst: return "takePictureFirst"
                case .takePictureSecond: return "takePictureSecond"
            }
        }
    }
}
