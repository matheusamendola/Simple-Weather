//
//  Weather.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation

let APPID = "f62231240a0e6bc332f2224ab784e5ff"

func getWeather(city: String, unit: String) {
    
    
    let session = URLSession.shared
    let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city),br?&units=\(unit)&APPID=\(APPID)")!
    let dataTask = session.dataTask(with: weatherURL) {
        (data: Data?, response: URLResponse?, error: Error?) in
        if let error = error {
        print("Erro: \(error)")
        } else {
            if let data = data {
            let dataString = String(data: data, encoding: String.Encoding.utf8)
            print("All the weather data:\n\(dataString!)")
            if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
            if let mainDictionary = jsonObj.value(forKey: "main") as? NSDictionary {
                //Variaveis
            let temperature = mainDictionary.value(forKey: "temp")
            }
            else {
            print("Error: unable to find temperature in dictionary")
            }
            } else {
            print("Error: unable to convert json data")
            }
            } else {
            print("Error: did not receive data")
            }
            }
    }
    dataTask.resume()
    
}
