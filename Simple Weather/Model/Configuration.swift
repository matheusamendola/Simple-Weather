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
    
    private init(){
        
    }
}
