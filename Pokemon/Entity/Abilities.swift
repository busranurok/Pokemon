//
//  Abilities.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class Abilities: Codable {
    
    var ability: Ability?
    var is_hidden: Bool?
    var slot: Int?
    
    init() {}
    
    init(ability:Ability, is_hidden:Bool, slot:Int) {
        
        self.ability = ability
        self.is_hidden = is_hidden
        self.slot = slot
        
    }
    
}
