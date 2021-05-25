//
//  ViewController.swift
//  TravelBook
//
//  Created by Osman Yıldız on 23.05.2021.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
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

    
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer){
        
        if gestureRecognizer.state == .began {
            //Dokunulan noktayı aldık.
            let touchedPoint = gestureRecognizer.location(in: mapView)
            //Dokunulan noktayı koordinata çevirdik.
            let touchedCoordinates = mapView.convert(touchedPoint, toCoordinateFrom: mapView)
            
            //Pinleme işlemi için Annotation oluşturduk.
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = "New Annotation"
            annotation.subtitle = "Travel Book"
            
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

