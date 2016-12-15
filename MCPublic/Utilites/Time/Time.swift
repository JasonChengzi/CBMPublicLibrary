//
//  Time.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 9/7/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

struct Time : CustomStringConvertible, Equatable {
    var hour : Int
    var minute : Int
    var second : Int
    
    var description: String {
        return "\(hour):\(minute):\(second)"
    }
    
    init() {
        hour = 0
        minute = 0
        second = 0
    }
    
    init(hour : Int, minute : Int, second : Int) {
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    init(fromString string : String, withSeparator separator : Character) {
        hour = 0
        minute = 0
        second = 0
        
        let substrings = string.split(withSeparator: separator)
        for i in 0..<substrings.count {
            if i == 0 { hour = substrings[i].toInt() }
            else if i == 1 { minute = substrings[i].toInt() }
            else if i == 2 { second = substrings[i].toInt() }
        }
    }
    
    static func now() -> Time {
        return Time(fromString: NSDateFormatter(dateFormat: "HH-mm-ss").stringFromDate(NSDate()), withSeparator: "-")
    }
    
    func isAtAM() -> Bool {
        if hour >= 0 && hour < 12 {
            return true
        }
        return false
    }
    func isAtPM() -> Bool {
        if hour >= 12 && hour < 24 {
            return true
        }
        return false
    }
    
    func isEarlier(than time : Time) -> Bool {
        if hour < time.hour {
            return true
        } else if hour == time.hour {
            if minute < time.minute {
                return true
            } else if minute == time.minute {
                if second < time.second {
                    return true
                }
            }
        }
        return false
    }
    func isLater(than time : Time) -> Bool {
        if self == time {
            return false
        }
        return !isEarlier(than: time)
    }
    func toString() -> String {
        return "\(hour < 10 ? "0" : "")\(hour):\(minute < 10 ? "0" : "")\(minute)"
    }
}
func == (lhs: Time, rhs: Time) -> Bool {
    return lhs.hour == rhs.hour && lhs.minute == rhs.minute && lhs.second == rhs.second
}
