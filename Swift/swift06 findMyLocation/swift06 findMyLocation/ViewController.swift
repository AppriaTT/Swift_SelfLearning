//
//  ViewController.swift
//  swift06 findMyLocation
//
//  Created by Aaron on 16/7/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {
    @IBOutlet weak var locationL: UILabel!
    
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func findClicked(sender: AnyObject) {
       locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        locationL.text  = String("Error while updating location " + error.localizedDescription)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placeMarks, error) -> Void in
            
            if (error != nil){
                self.locationL.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placeMarks!.count > 0 {
                let pm = placeMarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.locationL.text = "Problem with the data received from geocoder"
            }
        })
    }
    
    func displayLocationInfo(placeMark: CLPlacemark?){
        
       if let containsPlacemark = placeMark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.locationL.text = locality! +  postalCode! +  administrativeArea! +  country!
        }
    }
}

