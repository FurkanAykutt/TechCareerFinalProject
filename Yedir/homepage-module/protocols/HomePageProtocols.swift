//
//  HomePageProtocols.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol {
    var homePageView:PresenterToViewHomePageProtocol?{get set}
    var homePageInteractor:PresenterToInteractorHomePageProtocol?{get set}
    func add(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)
    func getFoods()
}

protocol PresenterToInteractorHomePageProtocol {
    var homePagePresenter:InteractorToPresenterHomePageProtocol?{get set}
    func addFood(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)
    func getAllFoods()
    
}

protocol InteractorToPresenterHomePageProtocol {
    func sendDataToPresenter(foodsList: Array<Foods>,foodDescriptionList:Array<FoodsDescriptions>)
}

protocol PresenterToViewHomePageProtocol {
    func sendDataToView(foodsList: Array<Foods>,foodDescriptionList:Array<FoodsDescriptions>)
}


protocol PresenterToRouterHomePageProtocol {
    static func createModule(ref:HomePageVC)
}
