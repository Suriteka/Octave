//
//  ActionSparkMove.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import UIKit

/* Return the good values for Horizontal directions */
struct ActionSparkDirectionHorizontal {
    var direction: Direction
    var speed : CGFloat
    
    public enum Direction:String, CaseIterable {
        case forward,backward,left,right,forwardRight,forwardLeft,backwardRight,backwardLeft
        
        func value() -> CGPoint {
            switch self {
            case .forward: return CGPoint(x: 0, y: 1)
            case .backward: return CGPoint(x: 0, y: -1)
            case .left: return CGPoint(x: -1, y: 0)
            case .right: return CGPoint(x: 1, y: 0)
            case .forwardRight: return CGPoint(x: 1, y: 1)
            case .forwardLeft: return CGPoint(x: -1, y: 1)
            case .backwardRight: return CGPoint(x: 1, y: -1)
            case .backwardLeft: return CGPoint(x: -1, y: -1)
            }
        }
    }
    
    func description() -> String {
        return "\(direction)"
    }
}
