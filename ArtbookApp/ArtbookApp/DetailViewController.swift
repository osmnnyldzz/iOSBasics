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
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPaintingName = ""
    var chosenPaintingID : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPaintingName != "" {
            //Core Data
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context  = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            
            let idString = chosenPaintingID?.uuidString
            
            // Yazdığımız koşulu bulup getiriyor. Ör: Sadece bir resim çekmek içim kullanacağız.
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                
                if results.count >= 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameTextField.text = name
                        }
                        if let year = result.value(forKey: "year") as? Int {
                            yearTextField.text = String(year)
                        }
                        if let artist = result.value(forKey: "artist") as? String? {
                            artistTextField.text = artist
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data{
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
 
                    }
                }
                
            } catch {
                print("Error")
            }
            
            
        }
        else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameTextField.text = ""
            artistTextField.text = ""
            yearTextField.text = ""
        }

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

        // Diğer VC'lerle haberleşme için kullanılıyor.
        NotificationCenter.default.post(name: NSNotification.Name("NewData"), object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    

}
