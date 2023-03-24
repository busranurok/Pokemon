//
//  Pokemons.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class Pokemon: Codable {
    
    var name:String?
    var url:String?
    var abilities:[Abilities]?
    var sprites:Sprites?
    
    init() {}
    
    init(name:String, url:String, abilities:[Abilities], sprites:Sprites) {
        
        self.name = name
        self.url = url
        self.abilities = abilities
        self.sprites = sprites
        
    }
    
}
