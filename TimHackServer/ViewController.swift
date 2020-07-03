//
//  ViewController.swift
//  TimHackServer
//
//  Created by Giovanni Erpete on 03/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var managerPisition : CLLocationManager!
    var userPosition : CLLocationCoordinate2D!
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var titleTextField: UITextField!
    
    let coreDataController = CoreDataController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.myMapView.delegate = self
        self.managerPisition = CLLocationManager()
        self.managerPisition.delegate = self
        self.managerPisition.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.managerPisition.requestWhenInUseAuthorization()
        self.managerPisition.startUpdatingLocation()
        
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        self.userPosition = userLocation.coordinate
        print("[MapView - didUpdate]: posizione aggiornata: lat: \(self.userPosition.latitude) long: \(self.userPosition.longitude)")
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion (center: self.userPosition, span: span)
        
        mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        print("[MapView - regionDidChane] lat: \(mapView.centerCoordinate.latitude) long: \(mapView.centerCoordinate.longitude)")
        
    }
    
    @IBAction func addAnnotation(_ sender: Any) {
        
        print("[AddAnnotation] title: \(self.titleTextField.text ?? "No Title")")
        
        let annotation = MKPointAnnotation()
        annotation.title = self.titleTextField.text
        annotation.coordinate = self.myMapView.centerCoordinate
        myMapView.addAnnotation(annotation)
        
        self.coreDataController.addTotem(latitude: annotation.coordinate.latitude, longitude: annotation.coordinate.longitude, title: self.titleTextField.text ?? "", city: "Acerra")
        
    }
    
}

