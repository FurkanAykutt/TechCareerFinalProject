//
//  CartPageVC.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import UIKit
import Alamofire
import Kingfisher
class CartPageVC: UIViewController {
       
    @IBOutlet weak var lblTitle: UILabel!
    var foodsList = [CartFoods]()
    @IBOutlet weak var sepetYemeklerTableView: UITableView!
    var cartPresenterObject :ViewToPresenterCartProtocol?

       override func viewDidLoad() {
           super.viewDidLoad()
           sepetYemeklerTableView.delegate = self
           sepetYemeklerTableView.dataSource = self
           sepetYemeklerTableView.layer.cornerRadius = 32
           CartRouter.createModule(ref: self)
           lblTitle.text = "Yiyecek\nve İçecek"
           cartPresenterObject?.getFoods(kullanici_adi:"furkan_aykut")
       }
       
       override func viewWillAppear(_ animated: Bool) {
           cartPresenterObject?.getFoods(kullanici_adi:"furkan_aykut")
       }

}
extension CartPageVC :PresenterToViewCartProtocol{
    func sendDataToView(foodList: Array<CartFoods>) {
        self.foodsList = foodList
        DispatchQueue.main.async {
                   self.sepetYemeklerTableView.reloadData()
               }
    }
}
extension CartPageVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"sepetYemekHucre",for: indexPath ) as! SepetYemeklerTableViewCell
        cell.lblYemekAdi.text = food.yemek_adi!
        cell.lblYemekAdet.text = food.yemek_siparis_adet!
        cell.lblYemekFiyat.text = "₺ \(Int(food.yemek_fiyat!)!*Int(food.yemek_siparis_adet!)!)"
        cell.view.layer.cornerRadius = 16
        if let yemekFiyat = food.yemek_fiyat {
        cell.lblKazanc.text = "Bu üründen kazancın \(Int(yemekFiyat)!/2) ₺"
        }

        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
             DispatchQueue.main.async {
                cell.yemekImageView.kf.setImage(with: url)
             }
         }
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction, view, bool) in
                let food = self.foodsList[indexPath.row]
                
                let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.yemek_adi!) silinsin mi?", preferredStyle: .alert)
                let iptalAction = UIAlertAction(title: "İptal", style: .cancel) { (action) in
                  
                }
                alert.addAction(iptalAction)

                let yesAction = UIAlertAction(title: "Evet", style: .destructive) { (action) in
                        self.cartPresenterObject?.delete(sepet_yemek_id: food.sepet_yemek_id!, kullanici_adi: food.kullanici_adi!)
                        print("\(food.yemek_adi!) deleted")
                
                    
                }
                alert.addAction(yesAction)
                self.present(alert, animated: true)
           
             
        }
        deleteAction.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [deleteAction])
 }
}
