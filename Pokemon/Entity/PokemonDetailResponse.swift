//
//  PokemonAbilities.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class PokemonDetailResponse: Codable {
    
    var abilities:[Abilities]?
    var sprites:Sprites?
    
    init() {}
    
    init(abilities:[Abilities], sprites:Sprites) {
        
        self.abilities = abilities
        self.sprites = sprites
        
    }
    
}
