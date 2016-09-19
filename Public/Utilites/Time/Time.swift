//
//  Time.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 9/7/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

struct Time : CustomStringConvertible {
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
}