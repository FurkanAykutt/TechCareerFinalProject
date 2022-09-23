//
//  HomePagePresenter.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

class HomePagePresenter:ViewToPresenterHomePageProtocol{
    func add(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
        homePageInteractor?.addFood(yemekAdi: yemekAdi, yemekResimAdi: yemekResimAdi, yemekFiyat: yemekFiyat, yemekSiparisAdet: yemekSiparisAdet, kullaniciAdi: kullaniciAdi)
    }
    
    var homePageView: PresenterToViewHomePageProtocol?
    
    var homePageInteractor: PresenterToInteractorHomePageProtocol?
    
    func getFoods() {
        homePageInteractor?.getAllFoods()
    }
    
    
}
extension HomePagePresenter : InteractorToPresenterHomePageProtocol{
    func sendDataToPresenter(foodsList: Array<Foods>,foodDescriptionList:Array<FoodsDescriptions>) {
        homePageView?.sendDataToView(foodsList: foodsList,foodDescriptionList: foodDescriptionList)
    }
    
}
