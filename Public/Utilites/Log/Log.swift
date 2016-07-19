//
//  Log.swift
//  JRiOSAppFramework
//
//  Created by Jason Raylegih on 28/9/15.
//  Copyright (c) 2015 Jason Raylegih. All rights reserved.
//

class Log {
    
    enum LogType {
        case Common
        case System
        case Network
        case Notification
        case Image
        case Module
        
        var stringValue: String {
            switch self {
            //                  ==========2016-01-11 14:01:02==========
            case .Common:
                return "----------      【日志】      ----------"
            case .System:
                return "----------      【系统】      ----------"
            case .Network:
                return "----------      【网络】      ----------"
            case .Notification:
                return "----------      【通知】      ----------"
            case .Image:
                return "----------      【图片】      ----------"
            case .Module:
                return "----------      【模块】      ----------"
            }
        }
    }
    
    enum LogAlertType {
        case Info
        case Alert
        case Warn
        case Error
        
        var stringValue : String {
            switch self {
            case .Info:
                return "INFO: "
            case .Alert:
                return "ALERT: "
            case .Warn:
                return "WARN: "
            case .Error:
                return "ERROR: "
            }
        }
    }
    
    ///输出字符串
    class func printString(message : String?, fromFile file : String = #file, fromFunction function : String = #function, atLine line : Int = #line, type : LogType = .Common, alertType : LogAlertType = .Info, extraInfo : Bool = true) {
        #if DEBUG
            if extraInfo {
                print("==========\(NSDate().toStandardString)==========\n(In file \(file) at line \(line).)\n[func \(function)]\n\(type.stringValue)\n\(alertType.stringValue)\n\(message)\n")
            } else {
                print(message)
            }
        #endif
    }
    ///带时间的字符串
    class func logString(message : String?) {
        #if DEBUG
            print("==========\(NSDate().toStandardString)==========\n\(message ?? "nil message.")")
        #endif
    }
    ///输出值
    class func printValue<T>(value: T, fromFile file: String = #file, fromFunction function: String = #function, atLine line: Int = #line, logType type: LogType = LogType.Common, alertType : LogAlertType = .Info, extraInfo : Bool = true) {
        #if DEBUG
            if extraInfo {
                print("==========\(NSDate().toStandardString)==========\n(In file \(file) at line \(line).)\n[func \(function)]\n\(type.stringValue)\n\(alertType.stringValue)\n\(value)\n")
            } else {
                print(value)
            }
        #endif
    }
    ///带时间的值
    class func logValue<T>(value : T) {
        #if DEBUG
            print("==========\(NSDate().toStandardString)==========\n\(value)")
        #endif
    }
}


