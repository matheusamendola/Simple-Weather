//
//  Weather.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import NVActivityIndicatorView

extension ViewController{
    func getWeather(lat: Double, lon: Double, unit: String){
        let APPID = "f62231240a0e6bc332f2224ab784e5ff"
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=\(unit)&appid=\(APPID)")!
        
        //let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city),br?&units=\(unit)&APPID=\(APPID)")!
        
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error { print("Erro: \(error)")}
            else {
                if let data = data {
                let dataString = String(data: data, encoding: String.Encoding.utf8)
                print("All the weather data:\n\(dataString!)")
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                            if let mainDictionary = jsonObj.value(forKey: "main") as? NSDictionary {
                                if let temperature = mainDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    self.Weather.text = " \(temperature)°C"
                                    
                                }
                            }
                                if let sysDictionary = jsonObj.value(forKey: "sys") as? NSDictionary {
                                    let city = sysDictionary.value(forKey: "name")
                                    DispatchQueue.main.async {
                                        self.City.text = "\(city)"}
                                }
                        
                        } else {
                    print("Error: unable to find temperature in dictionary")
                    }
                    }
                }
            }
        }
        dataTask.resume()
    }
    
}

