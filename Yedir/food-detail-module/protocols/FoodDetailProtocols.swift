//
//  FoodDetailProtocols.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

protocol ViewToPresenterFoodDetailProtocol {
    var foodDetailInteractor:PresenterToInteractorFoodDetailProtocol?{get set}
    func add(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)
    
}
protocol PresenterToInteractorFoodDetailProtocol {
    func addFood(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)
}
protocol PresenterToRouterFoodDetailProtocol {
    static func createModule(ref:FoodDetailVC)
}
