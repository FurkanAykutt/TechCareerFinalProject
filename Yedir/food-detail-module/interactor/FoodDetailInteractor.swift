//
//  FoodDetailInteractor.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation
import Alamofire
class FoodDetailInteractor:PresenterToInteractorFoodDetailProtocol{
    func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
        let params : Parameters = ["yemek_adi":yemekAdi,"yemek_resim_adi":yemekResimAdi,"yemek_fiyat":yemekFiyat,"yemek_siparis_adet":yemekSiparisAdet,"kullanici_adi":kullaniciAdi]
        AF.request(
            "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).response { response in
                if let data = response.data{
                    do{
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                            print(json)
                        }
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
    }
    
    
}
