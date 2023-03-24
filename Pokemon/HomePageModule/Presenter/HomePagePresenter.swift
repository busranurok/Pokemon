//
//  HomePagePresenter.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class HomePagePresenter: ViewToPresenterHomePageProtocol {
    
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    var homePageView: PresenterToViewHomePageProtocol?
    
    func loadAllPokemons() {
        
        homePageInteractor?.fetchAllPokemons()
        
    }
    
}

extension HomePagePresenter: InteractorToPresenterHomePageProtocol {
    
    func sendDataToPresenter(pokemonList: Array<Pokemon>) {
        
        homePageView?.sendDataToView(pokemonList: pokemonList)
        
    }
    
}
