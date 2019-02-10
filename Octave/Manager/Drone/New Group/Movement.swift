//
//  Mouvement.swift
//  SparkPerso
//
//  Created by AL on 11/01/2019.
//  Copyright © 2019 AlbanPerli. All rights reserved.
//

import UIKit

struct Movement {
    var direction:Direction
    var duration:CGFloat
    var speed:CGFloat
    
    enum Direction:String,CaseIterable {
        case top,back,left,right,topRight,topLeft,bottomRight,bottomLeft,stop
        
        func value() -> CGPoint {
            switch self {
                case .top: return CGPoint(x: 0, y: 0.1)
                case .back: return CGPoint(x: 0, y: -0.1)
                case .left: return CGPoint(x: -0.1, y: 0)
                case .right: return CGPoint(x: 0.1, y: 0)
                case .topRight: return CGPoint(x: 0.1, y: 0.1)
                case .topLeft: return CGPoint(x: -0.1, y: 0.1)
                case .bottomRight: return CGPoint(x: 0.1, y: -0.1)
                case .bottomLeft: return CGPoint(x: -0.1, y: -0.1)
                case .stop: return CGPoint(x: 0, y: 0)
            }
        }
    }
    
    func description() -> String {
        return "\(direction.rawValue) during \(duration)s at \(speed) speed"
    }
}

