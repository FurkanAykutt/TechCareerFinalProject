//
//  HomePageInteractor.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation
import Alamofire
import Firebase
class HomePageInteractor: PresenterToInteractorHomePageProtocol {
    func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
        let params: Parameters = ["yemek_adi": yemekAdi, "yemek_resim_adi": yemekResimAdi, "yemek_fiyat": yemekFiyat, "yemek_siparis_adet": yemekSiparisAdet, "kullanici_adi": kullaniciAdi]
        AF.request(
            "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print("eklendi")
                        print(json)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    var homePagePresenter: InteractorToPresenterHomePageProtocol?
    var refYemekler = Database.database().reference().child("yemekler")
    var gYemekList = [Foods]()
    var gYemekAciklamaList = [FoodsDescriptions]()
    func getAllFoods() {
        print("tetiklendi")

        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response { response in
            if let data = response.data {
                print("1inci ife girdi")
                do {
                    let cevap = try JSONDecoder().decode(FoodsResponse.self, from: data)
                    if let gelenListe = cevap.yemekler {
                        print("2inci ife girdi")
                        self.gYemekList = gelenListe
                    }
                    else {
                        print("null geldi")
                    }

                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        print("firebase tetiklendi")
        refYemekler.observe(.value, with: { snapshot in
            var liste = [FoodsDescriptions]()
            if let gelenVeri = snapshot.value as? [String: AnyObject] {
                for satir in gelenVeri {
                    if let d = satir.value as? NSDictionary {
                        let foodDesc = FoodsDescriptions(food_description: d["food_description"] as? String ?? "", food_categori: d["food_categori"] as? String ?? "", food_calori: d["food_calori"] as? String ?? "", food_yore: d["food_yore"] as? String ?? "", food_id: d["food_id"] as? Int ?? 1)
                        liste.append(foodDesc)
                        print(foodDesc)
                    }
                }
            }
            self.homePagePresenter?.sendDataToPresenter(foodsList: self.gYemekList, foodDescriptionList: liste)

        })

    }


}
