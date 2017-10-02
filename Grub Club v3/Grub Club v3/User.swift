//
//  User.swift
//  Grub Club v3
//
//  Created by Nathan Chang on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

class User {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    //add whatever vars you need here, but be sure to update the initializer
    

    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
    
}
