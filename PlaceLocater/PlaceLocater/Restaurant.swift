//
//  Restaurant.swift
//  PlaceLocater
//
//  Created by Abhinav on 9/30/17.
//  Copyright © 2017 Abhinav. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    var name: String
    var placeID: String
    var priceLevel: Int
    var image: UIImageView?
    var rating: Double?
    
    init(name:String, placeID:String, priceLevel:Int, rating:Double){
        self.name = name
        self.placeID = placeID
        self.priceLevel = priceLevel
        self.rating = rating
    }
    
    init(name:String, placeID:String, priceLevel:Int){
        self.name = name
        self.placeID = placeID
        self.priceLevel = priceLevel
    }
}