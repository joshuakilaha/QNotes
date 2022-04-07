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
    
    if minute < 60 {
        return "\(minute) minutes ago"
    }
    else if minute > 60 && hours < 24 {
        return "\(hours) hours ago"
    }
    else {
        return "\(days) days ago"
    }
}
