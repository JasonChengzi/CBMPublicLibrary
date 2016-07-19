//
//  NSStringExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/29.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension NSString {
    var MD5 : NSString {
        return self.md5()
    }
    //判断字符串是否为空内容
    func isEmpty() -> Bool {
        if self.length < 1 {
            return true
        } else {
            return false
        }
    }
    //对字符串进行md5加密
    func md5() -> NSString {
        return NSString(string: String(self).md5())
    }
    
    func getFirstLetter() -> NSString {
        return (self as String).firstLetter.toNSString
    }
}