//
//  ActionGimbalRotation.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import UIKit

struct ActionSparkGimbalRotation{
    var direction: Direction
    var speed: CGFloat
    
    public enum Direction:String, CaseIterable {
        case top,bottom
        
        func value() -> Float {
            switch self {
                case .top: return 90.0
                case .bottom: return -90.0
            }
        }
    }
    
    func description() -> String {
        return "\(direction)"
    }
}
