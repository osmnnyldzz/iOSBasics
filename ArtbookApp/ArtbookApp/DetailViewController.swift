//
//  DetailViewController.swift
//  ArtbookApp
//
//  Created by Osman Yıldız on 7.03.2021.
//

import UIKit
import CoreData

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        //Artık kullanıcı görsele tıklayabilir.
        imageView.isUserInteractionEnabled = true
        
        
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    

    @IBAction func SaveButtonClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
        newPainting.setValue(nameTextField.text!, forKey: "name")
    
        if let intYear = Int(yearTextField.text!){
            newPainting.setValue(intYear, forKey: "year")
        }
    
        
        newPainting.setValue(artistTextField.text!, forKey: "artist")
        
        newPainting.setValue(UUID(), forKey: "id")
        
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        newPainting.setValue(data, forKey: "image")
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error")
        }

    }
    

}
