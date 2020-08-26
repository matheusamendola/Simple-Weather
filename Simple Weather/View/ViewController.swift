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
    @IBOutlet weak var Updating: UIActivityIndicatorView!
    @IBOutlet weak var lbMin: UILabel!
    @IBOutlet weak var lbMax: UILabel!
    
    
 
    @IBOutlet weak var ivRightNow: UIImageView!
    
    
    @IBAction func SwipeAction(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        getInformation()
    }
    
    override func viewDidLoad() {
        getInformation()
        super.viewDidLoad()
 
    }
    
    //Pega informacoes do local do usuário, aplica gradiente e coloca na tela inicial
    func getInformation(){
        //Solicita acesso a localizacao
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

    }
    func startUpdate(){
        Updating.startAnimating()
    }
    func stopUpdate(){
        Updating.stopAnimating()
    }
}


