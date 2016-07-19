//
//  NSObjectExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//

//https://github.com/devxoul/Then

extension NSObject {
    static var className : String {
        return String(self)
    }
    var className : String {
        return NSStringFromClass(self.classForCoder)
    }
}