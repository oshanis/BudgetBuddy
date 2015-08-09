//
//  SecondViewController.swift
//  BudgetBuddy5
//
//  Created by Oshani on 8/9/15.
//  Copyright (c) 2015 Oshani Seneviratne. All rights reserved.
//
//
import UIKit
import MapKit

class SecondViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            // Set coordinates to center map at bizhaus
            self.mapView.mapType = MKMapType.Hybrid
            
            self.mapView.delegate = self
            
            let center = locations[0].location //assuming everything is close to that region
        
            self.mapView.centerCoordinate = center
        
            let initialLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)
            let regionRadius: CLLocationDistance = 1000
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
            
        
        for location in locations{
            var amount = 0
            var datesVisited = [NSDate()]
            for event in events{
                if (event.location.location.latitude == location.location.latitude) &&
                    (event.location.location.longitude == location.location.longitude){
                    amount += event.amountSpent
                    datesVisited.append(event.dateTime)
                }
            }
            let annotation = MKPointAnnotation()
            annotation.title = "\(location.locationName): spent $450 for Drinking"
            annotation.subtitle = "Remaining $50 till 2015-09-08."
            annotation.coordinate = location.location
            
            self.mapView.addAnnotation(annotation)
            
        }
        
    }

    func mapView(mapView: MKMapView!, didDeselectAnnotationView annotationView: MKAnnotationView!) {
        println(annotationView.annotation.title!)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






