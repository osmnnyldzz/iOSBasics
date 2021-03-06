//
//  DetailViewController.swift
//  SimpsonBook
//
//  Created by Osman Yıldız on 6.03.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
        
    }
    

   

}
