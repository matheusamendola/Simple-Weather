//
//  Weather.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation

struct WeatherDatas {
    var temperature: String
    var city: String
    var description: String
    var main: String
    
    init(temperature: String, city: String, description: String, main: String) {
        self.temperature = temperature
        self.city = city
        self.description = description
        self.main = main
    }
    
}
