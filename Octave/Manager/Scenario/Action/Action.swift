//
//  Action.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import UIKit

// W
enum Action {
    case sparkDirectionHorizontal(direction: ActionSparkDirectionHorizontal.Direction, speed :CGFloat)
    case sparkDirectionVertical (direction: ActionSparkDirectionVertical.Direction, speed :CGFloat)
    case sparkEvent
    case sparkRotation
    case gimbalRotation
    case gimbalEvent
    
    var actionValues: Any {
        switch self {
        case let .sparkDirectionHorizontal(direction, speed):
            return ActionSparkDirectionHorizontal(direction : direction, speed: speed)
        case let .sparkDirectionVertical(direction, speed):
                return ActionSparkDirectionVertical(direction : direction, speed: speed)
        case let .sparkEvent:
                return "TODO"
        case let .sparkRotation:
                return "TODO"
        case let .gimbalRotation:
                return "TODO"
        case let .gimbalEvent:
                return "TODO"
        }
    }
    
    func getActionName() -> Any {
        switch self {
        case let .sparkDirectionHorizontal(direction):
            return direction
        case let .sparkDirectionVertical(direction):
            return direction
        case let .sparkEvent:
            return "TODO"
        case let .sparkRotation:
            return "TODO"
        case let .gimbalRotation:
            return "TODO"
        case let .gimbalEvent:
            return "TODO"
        }
    }
    
    func getActionType() -> String{
        switch self {
        case .sparkDirectionHorizontal:
            return ".sparkDirectionHorizontal"
        case .sparkDirectionVertical:
            return ".sparkDirectionVertical"
        case .sparkEvent:
            return ".sparkEvent"
        case .sparkRotation:
            return ".sparkRotation"
        case .gimbalRotation:
            return ".gimbalRotation"
        case .gimbalEvent:
            return ".gimbalEvent"
        }
    }
    
    func description() -> String {
        return "Action enum"
    }
    
}

