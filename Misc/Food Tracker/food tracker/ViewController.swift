//
//  ViewController.swift
//  Food Tracker
//
//  Created by Nathan Chang on 9/30/17.
//  Copyright © 2017 Nathan Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }

    //Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

