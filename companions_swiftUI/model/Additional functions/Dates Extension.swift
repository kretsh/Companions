//
//  Dates Extension.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import Foundation

extension Date {

    
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    
    func offset(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: dateString)!
        
        if years(from: date)   > 0 { return "\(years(from: date)) year(s) ago"   }
        if months(from: date)  > 0 { return "\(months(from: date)) months(s) ago"  }
        if days(from: date)    > 0 { return "\(days(from: date)) day(s) ago"    }
        if hours(from: date)   > 0 { return "\(hours(from: date)) hour(s) ago"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date)) minute(s) ago" }
        return ""
    }
}
