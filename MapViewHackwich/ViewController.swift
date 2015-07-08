//
//  ViewController.swift
//  MapViewHackwich
//
//  Created by Dan Morton on 7/7/15.
//  Copyright © 2015 Dan Morton. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    let locationManager = CLLocationManager()


    //setup
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    @IBAction func displayLocationButtonTapped(sender: AnyObject) {
        locationManager.stopUpdatingLocation()
        myMapView.showsUserLocation = true
        
        //getting the coordinate from the location manager
        let coordinate = locationManager.location?.coordinate
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coordinate!, span)
        myMapView.setRegion(region, animated: true)
        
        //configuring an annotation
        let anno = MKPointAnnotation()
        anno.title = "My location"
        anno.subtitle = "This is a location that I got from the locatoin manager."
        myMapView.addAnnotation(anno)
        
        
    }
}

