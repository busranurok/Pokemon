//
//  Sprites.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class Sprites: Codable {
    
    var back_default:String?
    var front_default:String?
    
    init() {}
    
    init(back_default:String, front_default:String) {
        
        self.back_default = back_default
        self.front_default = front_default
        
    }
    
}
