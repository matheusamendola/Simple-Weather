//
//  Configuration.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case metrical = "metrical"
    case notifications = "notification"
    case latitude = "latitude"
    case longitude = "longitude"
}

struct configuration {
    let defaults = UserDefaults.standard
    static var shared: configuration = configuration()
    
    var metric: Int{
        get{
            return defaults.integer(forKey: UserDefaultsKeys.metrical.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.metrical.rawValue)
        }
    }
    
    var notification: Bool {
        get{
            return defaults.bool(forKey: UserDefaultsKeys.notifications.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.notifications.rawValue)
        }
    }
    
    var latitude: Double{
        get{
            return defaults.double(forKey: UserDefaultsKeys.latitude.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.latitude.rawValue)
        }
    }
    
    var longitude: Double{
        get{
            return defaults.double(forKey: UserDefaultsKeys.longitude.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.longitude.rawValue)
        }
    }
    
    private init(){
        
    }
}
