//
//  Rating Control.swift
//  Food Tracker 2
//
//  Created by Jan Ephraim Nino Tanja on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

@IBDesignable class Rating_Control: UIStackView {

    //MARK: Properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        //this code just calls the super's init function
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        
        //clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        //clear the array
        ratingButtons.removeAll()
        
        //load the button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        for _ in 0..<starCount {
            //create the button
            let button = UIButton()
        
            //add constraints
        
            //disables automatically generated constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            //constrains the height and width manually
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
        
            //set up the button action
            button.addTarget(self, action: #selector(Rating_Control.ratingButtonTapped(button:)), for: .touchUpInside)
        
            //now add the button to the stack
            addArrangedSubview(button)
            
            //and add the new button to the rating button array
            ratingButtons.append(button)
        }
    }

}
