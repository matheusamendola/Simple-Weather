//
//  Locations.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 08/07/20.
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
        var config = configuration.shared
        startUpdate()
        let location = locations[0]
        latitude = location.coordinate.latitude
        config.latitude = latitude
        longitude = location.coordinate.longitude
        config.longitude = longitude
        TodayWeather()

        self.locationManager.stopUpdatingLocation()
    }
}
