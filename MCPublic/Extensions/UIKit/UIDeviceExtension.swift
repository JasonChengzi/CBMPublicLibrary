//
//  UIDeviceExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/07/04.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension UIDevice {
    var isSimulator : Bool {
        if self.model == .Simulator {
            return true
        } else {
            return false
        }
    }
    
    var model : UIDeviceModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 where value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return UIDeviceModel(identifier: identifier)
    }
    
    var modelName : String {
        return self.model.name
    }
}

enum UIDeviceModel {
    case iPodTouch5
    case iPodTouch6
    case iPhone4
    case iPhone4s
    case iPhone5
    case iPhone5c
    case iPhone5s
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhoneSE
    case iPad2
    case iPad3
    case iPad4
    case iPadAir
    case iPadAir2
    case iPadMini
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadPro
    case AppleTV
    case Simulator
    case Undefined
    
    init(identifier : String) {
        switch identifier {
        case "iPod5,1":                                 self = .iPodTouch5
        case "iPod7,1":                                 self = .iPodTouch6
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     self = .iPhone4
        case "iPhone4,1":                               self = .iPhone4s
        case "iPhone5,1", "iPhone5,2":                  self = .iPhone5
        case "iPhone5,3", "iPhone5,4":                  self = .iPhone5c
        case "iPhone6,1", "iPhone6,2":                  self = .iPhone5s
        case "iPhone7,2":                               self = .iPhone6
        case "iPhone7,1":                               self = .iPhone6Plus
        case "iPhone8,1":                               self = .iPhone6s
        case "iPhone8,2":                               self = .iPhone6sPlus
        case "iPhone8,4":                               self = .iPhoneSE
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":self = .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":           self = .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":           self = .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":           self = .iPadAir
        case "iPad5,3", "iPad5,4":                      self = .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":           self = .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":           self = .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":           self = .iPadMini3
        case "iPad5,1", "iPad5,2":                      self = .iPadMini4
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":self = .iPadPro
        case "AppleTV5,3":                              self = .AppleTV
        case "i386", "x86_64":                          self = .Simulator
        default:                                        self = .Undefined
        }
    }
    
    var name : String {
        switch self {
        case iPodTouch5:    return "iPod Touch 5"
        case iPodTouch6:    return "iPod Touch 6"
        case iPhone4:       return "iPhone 4"
        case iPhone4s:      return "iPhone 4s"
        case iPhone5:       return "iPhone 5"
        case iPhone5c:      return "iPhone 5c"
        case iPhone5s:      return "iPhone 5s"
        case iPhone6:       return "iPhone 6"
        case iPhone6Plus:   return "iPhone 6 Plus"
        case iPhone6s:      return "iPhone 6s"
        case iPhone6sPlus:  return "iPhone 6s Plus"
        case iPhoneSE:      return "iPhone SE"
        case iPad2:         return "iPad 2"
        case iPad3:         return "iPad 3"
        case .iPad4:        return "iPad 4"
        case iPadAir:       return "iPad Air"
        case iPadAir2:      return "iPad Air 2"
        case iPadMini:      return "iPad Mini"
        case iPadMini2:     return "iPad Mini 2"
        case iPadMini3:     return "iPad Mini 3"
        case iPadMini4:     return "iPad Mini 4"
        case iPadPro:       return "iPad Pro"
        case AppleTV:       return "Apple TV"
        case Simulator:     return "Simulator"
        case Undefined:     return "Undefined"
        }
    }
}