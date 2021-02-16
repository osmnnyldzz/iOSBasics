//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Osman Yıldız on 15.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var NameText: UILabel!
    @IBOutlet weak var BirthdayField: UITextField!
    @IBOutlet weak var BirthdayText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameText.text = UserDefaults.standard.object(forKey: "NameField") as? String
        BirthdayText.text = UserDefaults.standard.object(forKey: "BirthdayField") as? String
    }


    @IBAction func DeleteClicked(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "NameField")
        UserDefaults.standard.removeObject(forKey: "BirthdayField")
        
        NameText.text = ""
        BirthdayText.text = ""
    }
    
    @IBAction func SaveClicked(_ sender: Any) {
        NameText.text = NameField.text
        BirthdayText.text = BirthdayField.text
        
        UserDefaults.standard.setValue(NameField.text!, forKey: "NameField")
        UserDefaults.standard.setValue(BirthdayField.text!, forKey: "BirthdayField")
        
    }
}

