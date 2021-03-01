//
//  imageViewViewController.swift
//  LandmarkBookApp
//
//  Created by Osman Yıldız on 1.03.2021.
//

import UIKit

class imageViewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedLandmarkImage
        Label.text = selectedLandmarkName
        
    }

}
