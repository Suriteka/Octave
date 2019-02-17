//
//  ConfigManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import SwiftyJSON

class ConfigManager {
    static let shared = ConfigManager(configFile: "config")
    
    let config:JSON
    
    private init(configFile: String) {
        let configJSON = JSONManager.init(fileName: configFile)
        config = configJSON.decode()
    }
}
