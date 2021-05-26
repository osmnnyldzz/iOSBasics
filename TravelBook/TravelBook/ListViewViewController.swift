//
//  ListViewViewController.swift
//  TravelBook
//
//  Created by Osman Yıldız on 26.05.2021.
//

import UIKit

class ListViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(goToDetail))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    @objc func goToDetail(){
        performSegue(withIdentifier: "toViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "test"
        return cell
    }

}
