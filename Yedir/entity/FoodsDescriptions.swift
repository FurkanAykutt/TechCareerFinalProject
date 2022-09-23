//
//  FoodsDescriptions.swift
//  Yedir
//
//  Created by Furkan Aykut on 20.09.2022.
//

import Foundation

class FoodsDescriptions {
    var food_description: String?
    var food_categori: String?
    var food_calori: String?
    var food_yore: String?
    var food_id: Int?
    
    
    init(food_description:String,food_categori:String,food_calori:String,food_yore:String,food_id: Int) {
        self.food_description = food_description
        self.food_categori = food_categori
        self.food_calori = food_calori
        self.food_yore = food_yore
        self.food_id = food_id
        
    }
}
