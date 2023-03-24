//
//  HomePageProtocols.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    
    // fetchAllPokemons() bu fonksiyonu tetikleyebilmek için.
    var homePageInteractor:PresenterToInteractorHomePageProtocol? {get set}
    // sendDataToView(pokemonList:Array<Pokemon>)
    var homePageView:PresenterToViewHomePageProtocol? {get set}
    
    func loadAllPokemons()
    
}

protocol PresenterToInteractorHomePageProtocol {
    
    //InteractorToPresenter' daki fonksiyonu tetikleyebilmek için bu nesneyi çağırırız.
    var homePagePresenter:InteractorToPresenterHomePageProtocol? {get set}
    
    func fetchAllPokemons()
    
}

protocol InteractorToPresenterHomePageProtocol {
    
    func sendDataToPresenter(pokemonList:Array<Pokemon>)
    
}

protocol PresenterToViewHomePageProtocol {
    
    func sendDataToView(pokemonList:Array<Pokemon>)
    
}

protocol PresenterToRouterHomePageProtocol {
    
    static func createModule(ref: HomePageViewController)
    
}
