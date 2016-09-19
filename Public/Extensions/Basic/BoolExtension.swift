//
//  SwiftExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 7/26/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

// MARK: 初始化方法
extension Bool {
    /// 用字符串初始化，“1”为true，其他为false
    static func bool(fromString boolString : String) -> Bool { if boolString == "1" { return true } else { return false } }
    /// 用Int初始化，1为true，其他为false
    static func bool(fromInt boolInt : Int) -> Bool { if boolInt == 1 { return true } else { return false } }
}
// MARK: 计算属性
extension Bool {
    
}
// MARK: 判断属性
extension Bool {
    /// 布尔值是否为true
    var yes : Bool { return self == true }
    /// 布尔值是否为false
    var no : Bool { return self == false }
}
// MARK: get属性
extension Bool {
    /// Bool的相反值
    var opposite : Bool { return !self }
    /// 如果为true返回“1”，否则返回“0”
    var stringValue : String { if self == true { return "1" } else { return "0" } }
    var intValue : Int { if self == true { return 1 } else { return 0 } }
}
// MMARK: 判断方法
extension Bool {
    /// 布尔值是否为true
    func isTrue() -> Bool { return self == yes }
    /// 布尔值是否为false
    func isFalse() -> Bool { return self == no }
}

// MARK: 其他
extension Bool {
    /// 切换为相反值
    mutating func toggle() { self = !self }
}
