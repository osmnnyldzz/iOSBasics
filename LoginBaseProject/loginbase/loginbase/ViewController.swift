//
//  ViewController.swift
//  loginbase
//
//  Created by Osman Yıldız on 22.05.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    // MARK: - IBOutlet Area
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    // MARK: - Functions
    func postLogin(){
        let request = AF.request("https://reqres.in/api/login",method: .post,parameters: ["email":mailTextField.text!,"password":passwordTextField.text!])
    
        request.responseJSON{ (data) in
            print(data)
        }
    }
    
    
    // MARK: - IBAction Area
    @IBAction func loginButtonTapped(_ sender: Any) {
        postLogin()
    }
    

}

