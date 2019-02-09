//
//  JSONFileManager.swift
//  Octave
//
//  Created by Jonathan Alpay on 09/02/2019.
//  Copyright © 2019 Suriteka. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONFileManager {
    var path: String = ""
    
    init(fileName: String) {
        // Get the file
        if let tempPath = Bundle.main.path(forResource: fileName, ofType: "json") {
            self.path = tempPath
        } else {
            print("JSON file doesn't exist")
        }
    }
    
    func decode() -> JSON {
        var json:JSON = JSON()
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            json = try JSON(data: data)

        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
        
        return json
    }
    
}
