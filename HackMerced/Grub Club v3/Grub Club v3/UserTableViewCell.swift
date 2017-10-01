//
//  UserTableViewCell.swift
//  Grub Club v3
//
//  Created by Nathan Chang on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameUser: UILabel! //a User's name
    @IBOutlet weak var imageUser: UIImageView! //a User's picture
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
