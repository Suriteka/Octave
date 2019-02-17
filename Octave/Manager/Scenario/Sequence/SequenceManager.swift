//
//  ActionManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import DJISDK

/* Manage a sequence */
class SequenceManager {
    static let instance = SequenceManager()
    var sequences = [Sequence]()
    
    /* Restart a sequence */
    func restart() {
        ActionSequence.instance.content.removeAll()
        sequences = []
    }
    
    /* Append a sequence to the array—list */
    func appendSequence(sequence:Sequence) {
        ActionSequence.instance.content.append(sequence)
        sequences.append(sequence)
    }
    
    /* Play the sequence */
    func play() {
        print("*** Playing sequence ***")
        executeSequence()
    }
    
    /* Execute Sequences if there is any */
    func executeSequence() {
        if let sequence = sequences.first {
            
            for action in sequence.sequenceList {
                ActionManager.instance.executeAction(action: action)
            }
            
            Timer.scheduledTimer(withTimeInterval: TimeInterval(sequence.duration), repeats: false) { (t) in
                self.sequences.remove(at: 0)
                self.executeSequence()
            }
        } else {
            MovingManager.instance.stop()
            restart()
        }
    }
    
}
