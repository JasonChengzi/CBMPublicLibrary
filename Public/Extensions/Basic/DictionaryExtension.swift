//
//  DictionaryExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension Dictionary {
    var toString : String {
        var dicString = "{"
        for key in self.keys {
            var stringValue = self[key] as? String
            if self[key] as? String == nil {
                if let intValue = self[key] as? Int {
                    stringValue = "\(intValue)"
                } else if let floatValue = self[key] as? Float {
                    stringValue = "\(floatValue)"
                } else if let doubleValue = self[key] as? Double {
                    stringValue = "\(doubleValue)"
                }
            }
            dicString += "\n        [\(key) : \((stringValue ?? ""))]"
        }
        return dicString + "\n    }"
    }
}

extension Dictionary : Loggable {
    
}