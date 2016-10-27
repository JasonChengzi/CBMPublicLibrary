import Foundation

extension Date {
    struct Offset {
        var years   : Int?
        var months  : Int?
        var weeks   : Int?
        var days    : Int?
        var hours   : Int?
        var minutes : Int?
        var seconds : Int?
        
    }
    
    func offset(from date : Date) -> Offset {
        let years   = Calendar.current.dateComponents([.year], from: date, to: self).year
        let months  = Calendar.current.dateComponents([.month], from: date, to: self).month
        let weeks   = Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear
        let days    = Calendar.current.dateComponents([.day], from: date, to: self).day
        let hours   = Calendar.current.dateComponents([.hour], from: date, to: self).hour
        let minutes = Calendar.current.dateComponents([.minute], from: date, to: self).minute
        let seconds = Calendar.current.dateComponents([.second], from: date, to: self).second
        return Offset(years: years, months: months, weeks: weeks, days: days, hours: hours, minutes: minutes, seconds: seconds)
    }
}

extension Date {
    
}

extension Date {
    var timeStamp : Double { return timeIntervalSince1970 }
}

extension Date {
    func toString(with format : String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
