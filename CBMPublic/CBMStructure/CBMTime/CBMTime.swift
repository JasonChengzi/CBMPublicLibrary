import Foundation

typealias Time = CBMTime

struct CBMTime {
    var hour    : Int
    var minute  : Int
    var second  : Int
    
    init() {
        hour    = 0
        minute  = 0
        second  = 0
    }
    
    init(hour : Int) {
        self.init(hour: hour, minute: 0)
    }
    
    init(hour : Int, minute : Int) {
        self.init(hour: hour, minute: minute, second: 0)
    }
    
    init(hour : Int, minute : Int, second : Int) {
        self.init()
        self.hour = hour
        self.minute = minute
        self.second = second
    }
    
    init(string : String, format : String) {
        self.init()
        
        if let hourRange = string.range(of: "HH") {
            let tempHour = string[hourRange]
            hour = tempHour.toInt() ?? 0
        } else if let hourRange = string.range(of: "hh") {
            let tempHour = string[hourRange]
            hour = tempHour.toInt() ?? 0
        }
        
        if let minuteRange = string.range(of: "mm") {
            let tempMinute = string[minuteRange]
            minute = tempMinute.toInt() ?? 0
        }
        
        if let secondRange = string.range(of: "ss") {
            let tempSecond = string[secondRange]
            second = tempSecond.toInt() ?? 0
        }
    }
    
    init(string : String, separator : Character) {
        self.init()
        
        let substrings = string.split(with: separator)
        
        for (index, substring) in substrings.enumerated() {
            if index == 0 { hour = substring.toInt() ?? 0 }
            if index == 1 { minute = substring.toInt() ?? 0 }
            if index == 2 { second = substring.toInt() ?? 0 }
        }
    }
}

extension CBMTime {
    func string(with format : String) -> String {
        var tempFormat = format
        if tempFormat.contains("HH") {
            tempFormat = tempFormat.replacingOccurrences(of: "HH", with: "\(hour < 10 ? "0" : "")\(hour)")
        } else if tempFormat.contains("hh") {
            tempFormat = tempFormat.replacingOccurrences(of: "hh", with: "\(hour < 10 ? "0" : "")\(hour > 12 ? hour - 12 : hour)")
        }
        if tempFormat.contains("mm") {
            tempFormat = tempFormat.replacingOccurrences(of: "mm", with: "\(minute < 10 ? "0" : "")\(minute)")
        }
        if tempFormat.contains("ss") {
            tempFormat = tempFormat.replacingOccurrences(of: "ss", with: "\(second < 10 ? "0" : "")\(second)")
        }
        return tempFormat
    }
}

extension CBMTime : Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: CBMTime, rhs: CBMTime) -> Bool {
        return (lhs.hour == rhs.hour) && (lhs.minute == rhs.minute) && (lhs.second == rhs.second)
    }
}
