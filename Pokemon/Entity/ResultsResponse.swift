//
//  PokemonsResponse.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class ResultsResponse: Codable {
    
    var results: [Pokemon]?
    
    init() {}
    
    init(results:[Pokemon]) {
        
        self.results = results
        
    }
    
}
