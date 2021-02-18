//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Osman Yıldız on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var iOS = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     // Resime tıklanma özelliği verdik.
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePicture))
        
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }

    @objc func changePicture(){
        
        
        
        if iOS == false {
            imageView.image = UIImage(named: "iOSimage")
            myLabel.text = "iOS"
            iOS = true
        }
        else{
            imageView.image = UIImage(named: "androidimage")
            myLabel.text = "Android"
            iOS = false
        }
        
   
    }
   
    
}

