//
//  Restaurant.swift
//  Grub Club v3
//
//  Created by Nathan Chang on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

class Restaurant {
    
    //MARK: Properties
    
    var rname: String
    var placeID: String
    var priceLevel: Int
    var rating: Int
    
    //MARK: Initialization
    
    init?(rname: String, placeID: String, priceLevel: Int, rating: Int) {
        
        //prevents you from entering empty strings
        guard !rname.isEmpty else {
            return nil
        }
        
        //if this causes errors, remove it cuz I'm not 100% sure of the syntax
        guard !(rating >= 0) else {
            return nil
        }
        
        self.rname = rname
        self.placeID = placeID
        self.priceLevel = priceLevel
        self.rating = rating
        
    }
    
    
}
