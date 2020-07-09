//
//  Weather.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 08/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

extension ViewController {
    func TodayWeather(){
        var units: String
        if config.metric == 0{
            units = "metric"
        } else {
            units = "imperial"
        }
        
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=\(units)").responseJSON {
            response in
            if let responseStr = response.result.value {
                let jsonResponse = JSON(responseStr)
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                let iconName = jsonWeather["icon"].stringValue
                
                self.City.text = jsonResponse["name"].stringValue
                self.ivRightNow.image = UIImage(named: iconName)

                if self.config.metric == 0{
                    self.Weather.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°C"
                    
                    self.lbMin.text = "Min. \(Int(round(jsonTemp["temp_min"].doubleValue)))°C"
                    self.lbMax.text = "Max. \(Int(round(jsonTemp["temp_max"].doubleValue)))°C"
                    
                } else {
                    self.Weather.text = "\(Int(round(jsonTemp["temp"].doubleValue)))°F"
                    
                    self.lbMin.text = "Min. \(Int(round(jsonTemp["temp_min"].doubleValue)))°F"
                    self.lbMax.text = "Max. \(Int(round(jsonTemp["temp_max"].doubleValue)))°F"
                }

                let description = jsonWeather["description"].string
                self.Phrase.text = "\(jsonWeather["description"])"
                self.applyGradient(condition: description!)
                
                self.stopUpdate()

            }
        }
    }
}
