//
//  ViewController.swift
//  TravelBook
//
//  Created by Osman Yıldız on 23.05.2021.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    
    var locationManager = CLLocationManager()
    var choosenLatitude = Double()
    var choosenLongitude = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3.0
        mapView.addGestureRecognizer(gestureRecognizer)
    

    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        //İlk önce AppDelegate çağırıyoruz.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(titleText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(choosenLongitude, forKey: "longitude")
        newPlace.setValue(choosenLatitude, forKey: "latitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error")
        }
        
        
    }
    
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer){
        
        if gestureRecognizer.state == .began {
            //Dokunulan noktayı aldık.
            let touchedPoint = gestureRecognizer.location(in: mapView)
            //Dokunulan noktayı koordinata çevirdik.
            let touchedCoordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            choosenLatitude = touchedCoordinates.latitude
            choosenLongitude = touchedCoordinates.longitude
            
            //Pinleme işlemi için Annotation oluşturduk.
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = titleText.text
            annotation.subtitle = commentText.text
            
            //Pini haritaya ekledik.
            mapView.addAnnotation(annotation)
            
        }
        
    }
    
    // Güncellenen lokasyonu almaya yarayan fonksiyon.
    // CLLocation --> Enlem ve Boylam içerir.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Lokasyon.
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.latitude)
        
        // Zoom.
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // Bölge.
        let region = MKCoordinateRegion(center: location, span: span)
        
        // Haritayı set ettik.
        mapView.setRegion(region, animated: true)
    }

}

