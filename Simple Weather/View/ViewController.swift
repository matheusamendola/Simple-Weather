//
//  ViewController.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import UIKit
import CoreLocation
import AudioToolbox
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView


class ViewController: UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager() // create Location Manager object
    let apiKey = "f62231240a0e6bc332f2224ab784e5ff"

    
    var latitude = 11.344533
    var longitude = 104.33322
    let config = configuration.shared

    //Outlets
    @IBOutlet weak var Weather: UILabel!
    @IBOutlet weak var Phrase: UILabel!
    @IBOutlet weak var City: UILabel!
    
    
    @IBAction func SwipeAction(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        performSegue(withIdentifier: "detalied", sender: nil)
    }
    

    
    override func viewDidLoad() {
        // in the function you want to grab the user's location from
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        // You will need to update your .plist file to request the authorization
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        //applyGradient()
        super.viewDidLoad()
        print(config.metric)
        
    }
    
    func registerSettingsBundle(){
        let appDefaults = [String: AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    

}


