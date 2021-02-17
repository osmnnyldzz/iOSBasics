//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Osman Yıldız on 16.02.2021.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    var segueText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameText.text = segueText
    }
    

    
   

}
