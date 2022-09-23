//
//  SepetYemeklerTableViewCell.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import UIKit

class SepetYemeklerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblYemekAdi: UILabel!
    
    @IBOutlet weak var lblYemekFiyat: UILabel!
    @IBOutlet weak var lblYemekAdet: UILabel!
    @IBOutlet weak var lblKazanc: UILabel!
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
