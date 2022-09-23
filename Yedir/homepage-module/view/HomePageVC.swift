//
//  HomePageVC.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import UIKit
import Kingfisher

class HomePageVC: UIViewController,HucreProtocol {
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    var homePagePresenterObject:ViewToPresenterHomePageProtocol?
    var foodList = [Foods]()
    var foodDescriptionList = [FoodsDescriptions]()
    override func viewDidLoad() {
        super.viewDidLoad()
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        let genislik = yemeklerCollectionView.frame.size.width
        let hucreGenislik = (genislik-60)/3
          let tasarim = UICollectionViewFlowLayout()
          
          tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
          
          tasarim.minimumInteritemSpacing = 0
          tasarim.minimumLineSpacing = 10
          
          tasarim.itemSize = CGSize(width: (genislik-60)/3, height: hucreGenislik*2)
        yemeklerCollectionView.collectionViewLayout = tasarim
        
      
        HomePageRouter.createModule(ref: self)
        navigationController?.navigationBar.barStyle = .black
       
    }
    func buttonTiklandi(indexPath: IndexPath) {
        print("button tıklandı")
        let food = foodList[indexPath.row]
        homePagePresenterObject?.add(yemekAdi: food.yemek_adi!, yemekResimAdi: food.yemek_resim_adi!, yemekFiyat: Int(food.yemek_fiyat!)!, yemekSiparisAdet: 1, kullaniciAdi: "furkan_aykut")
    }
   
    override func viewWillAppear(_ animated: Bool) {
        homePagePresenterObject?.getFoods()
      }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetail"{
                let gidenveri = sender as? GonderilecekVeri
                let destinationVC = segue.destination as! FoodDetailVC
                destinationVC.gelenYemek = gidenveri?.food
                destinationVC.gelenYemekAciklama = gidenveri?.foodDesc
                
            }
        }
}
extension HomePageVC:PresenterToViewHomePageProtocol{
    func sendDataToView(foodsList: Array<Foods>,foodDescriptionList:Array<FoodsDescriptions>) {
        self.foodList = foodsList
        self.foodDescriptionList = foodDescriptionList
        self.foodDescriptionList.sort{
            $0.food_id ?? 0  < $1.food_id ?? 1
        }
        DispatchQueue.main.async {
            self.yemeklerCollectionView.reloadData()
        }
    }
}
struct GonderilecekVeri {
    var food:Foods
    var foodDesc:FoodsDescriptions
}
extension HomePageVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let food = foodList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! FoodCollectionViewCell
        cell.yemekAdiLabel.text = food.yemek_adi!
        cell.yemekFiyatLabel.text = "\(food.yemek_fiyat!) ₺"
        cell.hucreProtocol = self  //Yetkilendirdik
        cell.indexPath = indexPath //Yetkilendirdik
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"){
                   DispatchQueue.main.async {
                       cell.yemekResimImageView.kf.setImage(with: url)
                   }
               }
        cell.view.layer.cornerRadius = 16
      
       // cell.sepeteEkleBtn.layer.cornerRadius = 32
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let food = self.foodList[indexPath.row]
        let foodDesc = self.foodDescriptionList[indexPath.row]
        print(indexPath.row)
         let termData = GonderilecekVeri(food: food, foodDesc: foodDesc)
        performSegue(withIdentifier: "toDetail", sender: termData)
       }
    
}
