//
//  CartPresenter.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol{
    var cartView: PresenterToViewCartProtocol?
    var cartInteractor: PresenterToInteractorCartProtocol?
    
    func getFoods(kullanici_adi: String) {
        cartInteractor?.getAllFood(kullanici_adi: kullanici_adi)
    }
    
    func delete(sepet_yemek_id: String, kullanici_adi: String) {
        cartInteractor?.deleteFood(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}
extension CartPresenter :InteractorToPresenterCartProtocol{
    func sendDataToPresenter(foodsList: Array<CartFoods>) {
        cartView?.sendDataToView(foodList: foodsList)
    }
}
