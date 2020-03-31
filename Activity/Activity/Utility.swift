//
//  Utility.swift
//  Activity
//
//  Created by Viettasc Doan on 3/31/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import Foundation

class Utility {
    
    func encode(for item: Stuff) -> Void {
        let encoder = JSONEncoder()
        if let json = try? encoder.encode(item) {
            UserDefaults.standard.setValue(json, forKey: "Item")
        }
    }
    
    func decode() -> Stuff {
        if let draft = UserDefaults.standard.object(forKey: "Item") as? Data {
            let decoder = JSONDecoder()
            if let decoding = try? decoder.decode(Stuff.self, from: draft) {
                return decoding
            }
        }
        return Stuff(id: 0, name: "Viettasc", number: 1, description: "new")
    }
    
}
