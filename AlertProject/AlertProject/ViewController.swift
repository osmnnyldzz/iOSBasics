//
//  ViewController.swift
//  AlertProject
//
//  Created by Osman Yıldız on 17.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signUpClicked(_ sender: Any) {
        if usernameTextField.text == "" {
            self.AlertDialog(title: "Error!", message: "User Not Found!")
        }
        else if passwordTextField.text == "" {
            self.AlertDialog(title: "Error!", message: "Password Not Found!")
        }
        else if passwordTextField.text != passwordAgainTextField.text {
            self.AlertDialog(title: "Error!", message: "Password Not Match!")
        }
        else
        {
            self.AlertDialog(title: "Success!", message: "User Okay!")
        }
    }
    
    func AlertDialog(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

