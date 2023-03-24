//
//  HomePageInteractor.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation
import Alamofire

class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    
    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    
    let pokemonListUrl: String = "https://pokeapi.co/api/v2/pokemon?limit=21&offset=0"
    let pokemonDetailBaseUrl: String = "https://pokeapi.co/api/v2/pokemon/"
    
    func fetchAllPokemons() {
        
        AF.request(pokemonListUrl, method: .get).response { response in
            
            if let data = response.data {
                
                do {
                    
                    let decodedResponse = try JSONDecoder().decode(ResultsResponse.self, from: data)
                    
                    if let list = decodedResponse.results {
                        
                        Task {
                            
                            do{
                                await self.getPokemonDetails(pokemonList: list)
                            }
                            
                        }
                        
                    }
                    
                }catch{print(error.localizedDescription)}
                
            }
            
        }
        
    }
    
    func getPokemonDetails(pokemonList:Array<Pokemon>) async{
        
        for pokemon in pokemonList {
            
            let pokemonDetailUrl = "\(pokemonDetailBaseUrl)\(pokemon.name!)"
            
            if let url = URL(string: pokemonDetailUrl) {
                
                do{
                    
                    let data = try await self.afRequest(url: url)
                    let decodedResponse = try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
                    
                    if let abilities = decodedResponse.abilities {
                        
                        pokemon.abilities = abilities
                        
                    }
                    
                    if let sprites = decodedResponse.sprites {
                        
                        pokemon.sprites = sprites
                        
                    }
                    
                }catch{
                    
                    print(error.localizedDescription)
                    
                }
                
            }
            
        }
        
        self.homePagePresenter?.sendDataToPresenter(pokemonList: pokemonList)
        
    }
    
    func afRequest(url:URL) async throws -> Data {
        
        try await withUnsafeThrowingContinuation { continuation in
            
            AF.request(url, method: .get).validate().responseData { response in
                
                if let data = response.data {
                    
                    continuation.resume(returning: data)
                    
                    return
                }
                
                if let errorResponse = response.error {
                    
                    continuation.resume(throwing: errorResponse)
                    
                    return
                }
                
                fatalError("should not get here")
                
            }
            
        }
        
    }
    
}
