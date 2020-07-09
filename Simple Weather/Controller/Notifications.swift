//
//  Notifications.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 08/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import Foundation
import UserNotifications

extension ViewController {
    func askNotifications(){
        var config = configuration.shared
        
        let center = UNUserNotificationCenter.current()
        //Create the notification content
        let content = UNMutableNotificationContent()
        content.title = "Vai fazer tempo bom hoje"
        content.body = "Texto mais complexo"

        //Create the notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//
//        dateComponents.weekday = 3
//        dateComponents.hour = 13
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        //Create the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)

        //Register the request
        center.add(request) { (error) in
            //check the error parametrer
        }

    }
}



