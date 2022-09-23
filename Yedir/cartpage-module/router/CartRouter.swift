//
//  CartRouter.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol{
    static func createModule(ref: CartPageVC) {
        
        let presenter =  CartPresenter()
        
        ref.cartPresenterObject = presenter
        
        ref.cartPresenterObject?.cartInteractor = CartInteractor()
        ref.cartPresenterObject?.cartView = ref
        
        ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
        
    }
}
