//
//  ViewController.swift
//  ArtbookApp
//
//  Created by Osman Yıldız on 7.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
    }

    @objc func addButtonClicked(){
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }

}

