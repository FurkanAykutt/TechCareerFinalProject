//
//  FoodCollectionViewCell.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import UIKit
protocol HucreProtocol {
    func buttonTiklandi(indexPath:IndexPath)
}
class FoodCollectionViewCell: UICollectionViewCell {
    var hucreProtocol:HucreProtocol?
    var indexPath:IndexPath?
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    
    @IBOutlet weak var yemekResimImageView: UIImageView!
    @IBAction func sepeteEkleButton(_ sender: Any) {
        hucreProtocol?.buttonTiklandi(indexPath: indexPath!)
    }
    
}
