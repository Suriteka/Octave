//
//  ActionPhoto.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation

struct ActionSparkEvent{
    var event: Event
    
    public enum Event:String, CaseIterable {
        case takeOff,landing, stop
        
        func value() -> String {
            switch self {
                case .takeOff: return "takeOff"
                case .landing: return "landing"
                case .stop: return "stop"
            }
        }
    }
}
