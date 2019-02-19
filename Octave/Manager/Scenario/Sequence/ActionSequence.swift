//
//  ActionSequence.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation

/* Singleton of Action Sequence */
public class ActionSequence {
    public static let instance = ActionSequence()
    public var content:[Sequence] = []
}
