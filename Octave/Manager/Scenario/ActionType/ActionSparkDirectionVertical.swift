//
//  ActionGimbalMove.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//
import UIKit
import Foundation

/* Return good values to move in Vertical */
struct ActionSparkDirectionVertical{

    var direction: Direction
    var speed: CGFloat
    
    /* Select the good direction */
    public enum Direction:String, CaseIterable {
        case top,bottom
        
        func value() -> CGFloat {
            switch self {
            case .top: return 1
            case .bottom: return -1
            }
        }
    }
    
    func description() -> String {
        return "\(direction)"
    }
}
