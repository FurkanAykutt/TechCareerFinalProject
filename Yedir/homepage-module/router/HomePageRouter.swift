//
//  HomePageRouter.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

class HomePageRouter:PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePageVC) {
        let presenter = HomePagePresenter()
        //View
        ref.homePagePresenterObject = presenter
        //presenter
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageView = ref
              
        //Interactor
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
          }
}
