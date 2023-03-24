//
//  Ability.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class Ability: Codable {
    
    var name:String?
    var url:String?
    
    init() {}
    
    init(name:String, url:String) {
        
        self.name = name
        self.url = url
        
    }
    
}
