//
//  FoodDetailVC.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import UIKit

class FoodDetailVC: UIViewController {
    var adet = 1
    var gelenYemek : Foods?
    var gelenYemekAciklama:FoodsDescriptions?
    @IBOutlet weak var lblKategoriName: UILabel!
    var foodsDescList = [FoodsDescriptions]()
    @IBOutlet weak var lblYemekAciklama: UILabel!
    @IBOutlet weak var totalTutarView: UIView!
    @IBOutlet weak var lblAdet: UILabel!
    
    @IBOutlet weak var lblTotalTutar: UILabel!
    @IBAction func buttonDecrease(_ sender: Any) {
        if adet > 1{
            adet -= 1
            lblAdet.text = "\(adet)"
                    let totalTutar = (Int((gelenYemek!.yemek_fiyat!))!)*adet
            lblTotalTutar.text = String("\(totalTutar) ₺")
                }
    }
    
    @IBAction func buttonIncrease(_ sender: Any) {
        adet += 1
        lblAdet.text = "\(adet)"
                let totalTutar = (Int((gelenYemek!.yemek_fiyat!))!)*adet
        lblTotalTutar.text = String("\(totalTutar) ₺")
    }
    
    @IBAction func btnSepeteEkle(_ sender: Any) {
        foodDetailPresenterObject?.add(yemekAdi: gelenYemek!.yemek_adi!, yemekResimAdi: gelenYemek!.yemek_resim_adi!, yemekFiyat: Int(gelenYemek!.yemek_fiyat!)!, yemekSiparisAdet: adet, kullaniciAdi: "furkan_aykut")
    }
    @IBOutlet weak var gelenYemekImageView: UIImageView!
    @IBOutlet weak var lblYemekFiyat: UILabel!
    @IBOutlet weak var lblYemekAdi: UILabel!
    @IBOutlet weak var lblKaloriName: UILabel!
    @IBOutlet weak var lblYoreName: UILabel!
    var foodDetailPresenterObject:ViewToPresenterFoodDetailProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        FoodDetailRouter.createModule(ref: self)
       // foodDetailPresenterObject?.getFoodDescriptions()
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(gelenYemek!.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                self.gelenYemekImageView.kf.setImage(with: url)
            }
        }
        if let gelenYemekFiyat = gelenYemek?.yemek_fiyat {
            lblTotalTutar.text = "\(gelenYemekFiyat) ₺"
        }
        lblYoreName.text = gelenYemekAciklama?.food_yore
        lblKaloriName.text = gelenYemekAciklama?.food_calori
        lblKategoriName.text = gelenYemekAciklama?.food_categori
        lblYemekAciklama.text = gelenYemekAciklama?.food_description
        lblYemekAciklama.preferredMaxLayoutWidth = 300
        lblYemekAdi.text = gelenYemek!.yemek_adi!
        lblYemekFiyat.text = "\((gelenYemek!.yemek_fiyat)!) ₺"
        // Do any additional setup after loading the view.
    }
}
