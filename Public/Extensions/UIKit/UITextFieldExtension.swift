//
//  UITextFieldExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension UITextField {
    ///获取文本框内容长度
    var length : Int {
        //当文本内容不存在时返回0
        guard let text = self.text else {
            return 0
        }
        return text.characters.count
    }
    
    ///判断文本框是否为空内容
    var isEmpty : Bool {
        //当为文本内容不存在时
        guard let text = self.text else {
            return true
        }
        //当文本内容长度是否小于等于零时
        guard text.characters.count > 0 else {
            return true
        }
        //当文本内容为无内容时
        guard text != "" else {
            return true
        }
        //当文本内容为空格时
        guard text != " " else {
            return true
        }
        return false
    }
    ///判断文本长度
    func isGreaterThan(min : Int, andLessThan max : Int, andEqual equal : Bool = true) -> Bool {
        //当文本内容不存在时
        guard self.text != nil else {
            return false
        }
        if equal {
            if self.length >= min && self.length <= max {
                return true
            }
        } else {
            if self.length > min && self.length < max {
                return true
            }
        }
        return false
    }
    
    ///清空文本框
    func cleanTextField() {
        self.text = nil
    }
}

///正则表达式
extension UITextField {

}