//
//  ActionSparkRotation.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import UIKit

struct ActionSparkRotation{
    var direction: Direction
    var speed : CGFloat
    
    public enum Direction:String, CaseIterable {
        case clockwise,counterClockwise
        
        func value() -> CGFloat {
            switch self {
            case .clockwise: return -1
            case .counterClockwise: return 1
            }
        }
    }
    
    func description() -> String {
        return "\(direction)"
    }
}
