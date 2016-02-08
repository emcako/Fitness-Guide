//
//  CurrentLocationViewController.swift
//  Fitness Guide
//
//  Created by emcako on 06/02/2016.
//  Copyright © 2016 emcako. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CurrentLocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {


    @IBOutlet weak var mapsView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapsView.showsUserLocation = true
        self.mapsView.showsCompass = true
        
        let uilgr = UILongPressGestureRecognizer(target: self, action: "addAnnotation:")
        uilgr.minimumPressDuration = 1.0
        
        self.mapsView.addGestureRecognizer(uilgr)
        
           }
    
    func addAnnotation(gestureRecognizer:UIGestureRecognizer){
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            let touchPoint = gestureRecognizer.locationInView(mapsView)
            let newCoordinates = mapsView.convertPoint(touchPoint, toCoordinateFromView: mapsView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinates
            
            CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: newCoordinates.latitude, longitude: newCoordinates.longitude), completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = placemarks![0] 
                    
                    
                    annotation.title = pm.thoroughfare! + ", " + pm.subThoroughfare!
                    annotation.subtitle = pm.subLocality
                    self.mapsView.addAnnotation(annotation)
                    print(pm)
                }
                else {
                    annotation.title = "Unknown Place"
                    self.mapsView.addAnnotation(annotation)
                    print("Problem with the data received from geocoder")
                }
            })
        }
    }
    
    
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span:MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
        self.mapsView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
