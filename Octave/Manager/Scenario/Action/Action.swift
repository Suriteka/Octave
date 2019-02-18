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
    case sparkDirectionHorizontal(direction: ActionSparkDirectionHorizontal.Direction, speed: CGFloat)
    case sparkDirectionVertical(direction: ActionSparkDirectionVertical.Direction, speed: CGFloat)
    case sparkEvent(event: ActionSparkEvent.Event)
    case sparkRotation(direction: ActionSparkRotation.Direction, speed: CGFloat)
    case sparkGimbalRotation(direction: ActionSparkGimbalRotation.Direction, speed: CGFloat)
    case sparkGimbalEvent(event: ActionSparkGimbalEvent.Event)
    
    var actionValues: Any {
        switch self {
        case let .sparkDirectionHorizontal(direction, speed):
            return ActionSparkDirectionHorizontal(direction : direction, speed: speed)
        case let .sparkDirectionVertical(direction, speed):
            return ActionSparkDirectionVertical(direction : direction, speed: speed)
        case let .sparkEvent(event):
            return ActionSparkEvent(event: event)
        case let .sparkRotation(direction, speed):
            return ActionSparkRotation(direction : direction, speed: speed)
        case let .sparkGimbalRotation(direction, speed):
            return ActionSparkGimbalRotation(direction: direction, speed: speed)
        case let .sparkGimbalEvent(event):
            return ActionSparkGimbalEvent(event: event)
        }
    }
    
    func getActionName() -> Any {
        switch self {
        case let .sparkDirectionHorizontal(direction):
            return direction
        case let .sparkDirectionVertical(direction):
            return direction
        case let .sparkEvent(event):
            return event
        case let .sparkRotation(direction):
            return direction
        case let .sparkGimbalRotation(direction):
            return direction
        case let .sparkGimbalEvent(event):
            return event
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
        case .sparkGimbalRotation:
            return ".sparkGimbalRotation"
        case .sparkGimbalEvent:
            return ".sparkGimbalEvent"
        }
    }
    
    func description() -> String {
        return "Action enum"
    }
    
}

