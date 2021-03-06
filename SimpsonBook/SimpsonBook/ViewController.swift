//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Osman Yıldız on 6.03.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Simpson Objects
        let homer = Simpson(nameSimpson: "Homer",jobSimpson: "Nuclear Safety",imageSimpson: UIImage(named: "homersimpson")!)
        let marge = Simpson(nameSimpson: "Marge",jobSimpson: "HouseWife",imageSimpson: UIImage(named: "margesimpson")!)
        let lisa = Simpson(nameSimpson: "Lisa",jobSimpson: "Student",imageSimpson: UIImage(named: "lisasimpson")!)
        let bart = Simpson(nameSimpson: "Bart",jobSimpson: "Student",imageSimpson: UIImage(named: "bartsimpson")!)
    
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(lisa)
        mySimpsons.append(bart)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

