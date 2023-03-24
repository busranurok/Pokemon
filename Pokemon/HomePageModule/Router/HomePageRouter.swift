//
//  HomePageRouter.swift
//  Pokemon
//
//  Created by BusranurOK on 23.03.2023.
//

import Foundation

class HomePageRouter: PresenterToRouterHomePageProtocol {
    
    static func createModule(ref: HomePageViewController) {
        
        let presenter = HomePagePresenter()
        
        ref.homePagePresenter = presenter
        ref.homePagePresenter?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenter?.homePageView = ref
        
        ref.homePagePresenter?.homePageInteractor?.homePagePresenter = presenter
        
    }
    
}
