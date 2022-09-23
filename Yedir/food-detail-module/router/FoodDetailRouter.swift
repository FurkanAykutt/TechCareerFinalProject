//
//  FoodDetailRouter.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation
class FoodDetailRouter:PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailVC) {
        let presenter = FoodDetailPresenter()
        //View
        ref.foodDetailPresenterObject = presenter
        //presenter
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
          }
}
