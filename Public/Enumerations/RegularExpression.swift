//
//  RegularExpression.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/29.
//  Copyright © 2016年 Hvit. All rights reserved.
//

///常用正则表达式
enum RegularExpressionPattern : String {
    ///手机号码。13x/14x/15x/17x/18x
    case MobilePhoneNumber  = "^1[34578]\\d{9}$"
    ///Email地址。
    case EmailAddress       = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    ///身份证号码
    case IdentifyCardNumber = "^\\d{15}|\\d{18}$"
    ///IP地址。
    case IPAddress          = "((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)"
    ///纯数字。0-9数字组合
    case Numbers            = "^[0-9]*$"
    ///纯字母。
    case Alphabet           = "^[A-Za-z]+$"
    ///纯汉字
    case Chinese            = "[\\u4e00-\\u9fa5]"
}