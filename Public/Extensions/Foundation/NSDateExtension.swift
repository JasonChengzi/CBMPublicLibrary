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
    static var CurrentDate : NSDate {
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
    
    ///将时间转换为字符串
    var toStandardString : String {
        get {
            return NSDateFormatter.StandardDateFormatter.stringFromDate(self)
        }
    }
    
    func dateOfHour(hour : Int) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let components = NSDateComponents.dateComponentsWithCalendar(calendar, andDate: self)
        components.hour = hour
        components.minute = 0
        components.second = 0
        if let timeInterval = calendar.dateFromComponents(components)?.timeIntervalSince1970 {
            return NSDate(timeIntervalSince1970: timeInterval)
        } else {
            return nil
        }
    }
    var dateOfZero : NSDate? {
        return dateOfHour(0)
    }
    static var zeroOfToday : NSDate {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        return dateFormater.dateFromString(dateFormater.stringFromDate(NSDate()))!
    }
    
    // MARK: Time string
    func stringYearMonthDayCompareToday() -> String {
        var string = ""
        let chaDay = self.daysBetweenCurrentDateAndDate()
        if chaDay == 0 {
            string = "Today"
        } else if chaDay == 1 {
            string = "Tomorrow"
        } else if chaDay == -1 {
            string = "Yesterday"
        } else {
            string = self.stringYearMonthDay()
        }
        return string
    }
    
    static func stringLoacalDate() -> String {
        let formatter = NSDateFormatter()
        formatter.timeZone = NSTimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = NSDate()
        let zone = NSTimeZone.systemTimeZone()
        let interval = zone.secondsFromGMTForDate(date)
        let localDate = date.dateByAddingTimeInterval(interval.toDouble)
        return formatter.stringFromDate(localDate)
    }
    
    static func stringYearMonthDayWithDate(date : NSDate?) -> String {
        var theDate = date
        if theDate == nil {
            theDate = NSDate()
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.stringFromDate(theDate!)
    }
    
    static func dateMonthDayWithDate(date : NSDate?) -> String {
        var theDate = date
        if theDate == nil {
            theDate = NSDate()
        }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM.dd"
        return formatter.stringFromDate(theDate!)
    }
    
    static func dateStandardFormatTimeZeroWithDate(aDate : NSDate?) -> NSDate {
        let string = NSDate.stringYearMonthDayWithDate(aDate).stringByAppendingString("00:00:00")
        return NSDate.dateFromString(string)
    }
    
    func daysBetweenCurrentDateAndDate() -> Int {
        //只取年月日比较
        let dateSelf = NSDate.dateStandardFormatTimeZeroWithDate(self)
        let timeInterval = dateSelf.timeIntervalSince1970
        let dateNow = NSDate.dateStandardFormatTimeZeroWithDate(nil)
        let timeIntervalNow = dateNow.timeIntervalSince1970
        
        let cha = timeInterval - timeIntervalNow
        let chaDay = cha / 86400.0
        let day = chaDay * 1
        return day.toInt
    }
    
    static func dateFromString(string : String) -> NSDate {
        return NSDate.dateFromString(string, withFormat: NSDate.dbFormatString)
    }
    
    static func dateFromString(string : String, withFormat format : String) -> NSDate {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = format
        let date = inputFormatter.dateFromString(string)
        return date ?? NSDate()
    }
    
    static var dbFormatString : String {
        return NSDate.timestampFormatString
    }
    
    static var dateFormatString : String {
        return "yyyy-MM-dd"
    }
    
    static var timeFormatString : String {
        return "HH:mm:ss"
    }
    
    static var timestampFormatString : String {
        return "yyyy-MM-dd HH:mm:ss"
    }
    
    static var timestampFormatStringSubSeconds : String {
        return "yyyy-MM-dd HH:mm"
    }
    
    // MARK: Date String
    func stringTime() -> String {
        let formatter : NSDateFormatter  = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let str = formatter.stringFromDate(self)
        
        return str
    }
    func stringMonthDay() -> String {
        return NSDate.dateMonthDayWithDate(self)
    }
    func stringYearMonthDay() -> String {
        return NSDate.stringYearMonthDayWithDate(self)
    }
    func stringYearMonthDayHourMinuteSecond() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.stringFromDate(self)
    }
}

extension NSDateFormatter {
    ///获取标准日期格式器
    static var StandardDateFormatter : NSDateFormatter {
        get {
            let formatter = NSDateFormatter()
            formatter.dateStyle     = NSDateFormatterStyle.MediumStyle
            formatter.timeStyle     = NSDateFormatterStyle.ShortStyle
            formatter.dateFormat    = "yyyy-MM-dd HH:mm:ss"
            return formatter
        }
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