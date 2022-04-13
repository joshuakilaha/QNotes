//
//  TimeFormatting.swift
//  QNotes
//
//  Created by mroot on 07/04/2022.
//

import Foundation

// MARK: Time Update

/**
    calcTimeSince - function to get the time since last update
    @date: current date with hours & minutes
    Return - String
 */

func calcTimeSince(date: Date) -> String {
    let minute = Int(-date.timeIntervalSinceNow)/60
    let hours = minute / 60
    let days = hours / 24
    
    var longDate : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
       // return dateFormatter.string(from: Date())
        return dateFormatter.string(from: Date(timeInterval: TimeInterval(days), since: Date()))
    }
    
    if minute < 60 {
        return "\(minute) minutes ago"
    }
    else if minute > 60 && hours < 24 {
        return "\(hours) hours ago"
    }
    else if hours > 24 && hours < 48 {
        return "yesterday"
       
    } else {
        return longDate
    }
}
