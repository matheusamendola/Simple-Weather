//
//  Location.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit 
import AudioToolbox
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView


extension ViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var units: String
        if config.metric == 0{
            units = "metric"
        } else {
            units = "imperial"
        }
        let location = locations[0]
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(units)").responseJSON {
            response in
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                //let iconName = jsonWeather["icon"].stringValue
                
                self.City.text = jsonResponse["name"].stringValue
                //self.conditionImageView.image = UIImage(named: iconName)
                //self.conditionLabel.text = jsonWeather["main"].stringValue
                if self.config.metric == 0{
                    self.Weather.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°C"
                } else {
                    self.Weather.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°F"
                }
                //self.Weather.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°C"
                let description = jsonWeather["description"].string
                self.Phrase.text = "\(jsonWeather["description"])"
                self.applyGradient(condition: description!)

            }
        }
        self.locationManager.stopUpdatingLocation()
    }
    
}
