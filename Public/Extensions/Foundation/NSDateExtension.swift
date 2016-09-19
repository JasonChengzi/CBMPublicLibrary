//
//  NSDate.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit


extension NSDate {
    // MARK: Data component
    var year : Int {
        return self.specificDateForm.year
    }
    var month : Int {
        return self.specificDateForm.month
    }
    var day : Int {
        return self.specificDateForm.day
    }
    var hour : Int {
        return self.specificDateForm.hour
    }
    var miniute : Int {
        return self.specificDateForm.miniute
    }
    var second : Int {
        return self.specificDateForm.second
    }
    var weekday : String {
        let calendar = NSCalendar.currentCalendar()
        
        let date = NSDate()
        
        let comps = calendar.components([NSCalendarUnit.WeekOfYear, NSCalendarUnit.Weekday, NSCalendarUnit.WeekdayOrdinal], fromDate: date)
        let weekday = comps.weekday
        var week = ""
        switch weekday {
        case 1:
            week = "星期日"
        case 2:
            week = "星期一"
        case 3:
            week = "星期二"
        case 4:
            week = "星期三"
        case 5:
            week = "星期四"
        case 6:
            week = "星期五"
        case 7:
            week = "星期六"
        default:
            break
        }
        return week
    }
    ///获取时间的（年份、月份、日期、小时、分钟、秒数）
    var specificDateForm : (year : Int, month : Int, day : Int, hour : Int, miniute : Int, second : Int) {
        let dateComponents = NSDateComponents.dateComponentsWithCurrentCalendarAndDate(self)
        return (
            dateComponents.year,
            dateComponents.month,
            dateComponents.day,
            dateComponents.hour,
            dateComponents.minute,
            dateComponents.second
        )
    }
    
    ///获取当前时间的NSDate对象
    static var current : NSDate {
        get {
            return NSDate()
        }
    }
    
    ///转换为TimeStamp
    var timeStamp : Double {
        get {
            return self.timeIntervalSince1970
        }
    }
    
    ///标准日期格式日期字符串。yyyy-MM-dd HH:mm:ss
    var standardDateString : String {
        return NSDateFormatter.standardDateFormatter.stringFromDate(self)
    }
}

// MARK: 计算差值
extension Date {
    func years(from date : Date) -> Int { return Calendar.current.components(.Year, fromDate: date, toDate: self, options: []).year }
    func months(from date : Date) -> Int { return Calendar.current.components(.Month, fromDate: date, toDate: self, options: []).month }
    func weeks(from date : Date) -> Int { return Calendar.current.components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear }
    func days(from date : Date) -> Int { return Calendar.current.components(.Day, fromDate: date, toDate: self, options: []).day }
    func hours(from date : Date) -> Int { return Calendar.current.components(.Hour, fromDate: date, toDate: self, options: []).hour }
    func minutes(from date : Date) -> Int { return Calendar.current.components(.Minute, fromDate: date, toDate: self, options: []).minute }
    func seconds(from date : Date) -> Int { return Calendar.current.components(.Second, fromDate: date, toDate: self, options: []).second }
    
    func offset(from date : Date) -> String {
        if case let years = self.years(from: date) where years > 0 { return "\(years)年" }
        if case let months = self.months(from: date) where months > 0 { return "\(months)月" }
        if case let weeks = self.months(from: date) where weeks > 0 { return "\(weeks)周" }
        if case let days = self.months(from: date) where days > 0 { return "\(days)天" }
        if case let hours = self.months(from: date) where hours > 0 { return "\(hours)小时" }
        if case let minutes = self.months(from: date) where minutes > 0 { return "\(minutes)分钟" }
        if case let seconds = self.months(from: date) where seconds > 0 { return "\(seconds)秒" }
        return ""
    }
}


extension NSDateFormatter {
    ///获取标准日期格式器
    static var standardDateFormatter : NSDateFormatter {
        get {
            let formatter = NSDateFormatter()
            formatter.dateStyle     = NSDateFormatterStyle.MediumStyle
            formatter.timeStyle     = NSDateFormatterStyle.ShortStyle
            formatter.dateFormat    = "yyyy-MM-dd HH:mm:ss"
            return formatter
        }
    }
    
    static func dateFormatter(withFormat format : String) -> NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter
    }
}

extension NSCalendar {
    static var current : NSCalendar {
        return NSCalendar.currentCalendar()
    }
}

extension NSDateComponents {
    class func dateComponentsWithCurrentCalendarAndDate(date : NSDate) -> NSDateComponents {
        return dateComponentsWithCalendar(NSCalendar.currentCalendar(), andDate: date)
    }
    class func dateComponentsWithCalendar(dateCalendar : NSCalendar, andDate date : NSDate) -> NSDateComponents {
        return dateCalendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date)
    }
}