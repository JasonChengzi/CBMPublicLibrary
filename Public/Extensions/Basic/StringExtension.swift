//
//  StringExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit
// MARK: 字符串的静态初始化方法
extension String {
}
// MARK: 字符串的计算属性
extension String {
    ///获取字符串长度
    var length : Int { return self.characters.count }
}
// MARK: 字符串的判断属性
extension String {
    ///字符串是否为没有内容，包括长度为0、""、“ ”、"\0"
    var empty : Bool { if self.length == 0 || self == "" || self == " " || self == "\0" { return true } else { return false } }
    ///字符串是否为空，包括长度为0、“”
    var blank : Bool { if self.length == 0 || self == "" { return true } else { return false } }
}
// MARK: 判断方法
extension String {
    ///判断是否满足正则表达式
    func isMatchingPattern(pattern : Pattern) -> Bool {
        let regex : NSRegularExpression? = try? NSRegularExpression(pattern: pattern.pattern, options: NSRegularExpressionOptions.CaseInsensitive)
        if let matches = regex?.matchesInString(self, options: [], range: NSMakeRange(0, self.nsstring.length)) {
            return matches.count > 0
        } else {
            return false
        }
    }
}
// MARK: 字符串的转换属性
extension String {
    /// 转换为NSString对象
    var nsstring : NSString { return NSString(string: self) }
    /// 转换为Optional Int
    var intValue : Int? { return Int(self) }
    /// 转换为Optional Float
    var floatValue : Float? { return Float(self) }
    /// 转换为Optional Double
    var doubleValue : Double? { return Double(self) }
    
    /// 16进制字符串转换为Int
    var hexaToInt : Int { return Int(strtoul(self, nil, 16)) }
    /// 16进制字符串转换为Double
    var hexaToDouble : Double { return Double((strtoul(self, nil, 16))) }
    /// 16进制字符串转换为2进制字符串
    var hexaToBinary : String { return String(hexaToInt, radix: 2) }
    
    /// 10进制转换为16进制
    var decimalToHexa : String { return String(Int(self) ?? 0, radix: 16)}
    /// 10进制转换为2进制
    var decimalToBinary : String { return String(Int(self) ?? 0, radix: 2) }
    
    /// 2进制转换为Int
    var binaryToInt : Int { return Int(strtoul(self, nil, 2)) }
    /// 2进制转换为Double
    var binaryToDouble : Double { return Double(strtoul(self, nil, 2)) }
    /// 2进制转换为16进制
    var binaryToHexa : String { return String(binaryToInt, radix: 16) }
    
    /// 字符串转换为[String]
    var array : [String] {
        var tempArray = [String]()
        for character in self.characters { tempArray.append(String(character)) }
        return tempArray
    }
    /// 字符串转换为字母
    var letters : String {
        let str = NSMutableString(string: self)
        if CFStringTransform(str, nil, kCFStringTransformMandarinLatin, false) {
            if CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false) {
                return str as String
            }
        }
        return self
    }
}
// MARK: 转换方法，toX()
extension String {
    /// 转换为NSString
    func toNSString() -> NSString { return nsstring }
    
    /// 转换为Int，失败返回0
    func toInt() -> Int { return intValue ?? 0 }
    /// 转换为Float，失败返回0
    func toFloat() -> Float { return floatValue ?? 0 }
    /// 转换为Double，失败返回0
    func toDouble() -> Double { return doubleValue ?? 0 }
    /// 转换为数组
    func toArray() -> [String] { return array }
}
// MARK: 字符串的get属性
extension String {
    ///获取第一个字母
    var firstLetter : String {
        var ret = ""
        if !self.canBeConvertedToEncoding(NSASCIIStringEncoding) {
            ret = self.letters.firstLetter
        } else {
            ret = "\("\(self.characters.first)" ?? "")"
        }
        return ret
    }
}
// MARK: Getter 
extension String {
    func getFirstLetter() -> String {
        return self.firstLetter
    }
    
    ///插入字符串
    func insert(atIndex index : Int, withSubstring substring : String) -> String {
        return String(self.characters.prefix(index)) + substring + String(self.characters.suffix(self.characters.count - index))
    }
}
// MARK: Foundation
extension String {
    /// 拓展 NSString.stringByAppendingPathComponent
    func stringByAppendingPathComponent(component : String) -> String {
        return (self as NSString).stringByAppendingPathComponent(component) as String
    }
    /// 拓展 NSString.stringByDeletingPathExtension
    func stringByDeletingPathExtension() -> String {
        return (self as NSString).stringByDeletingPathExtension as String
    }
    /// 拓展 NSString.stringByAppendingPathExtension
    func stringByAppendingPathExtension(pathExtension : String) -> String {
        return (self as NSString).stringByAppendingPathExtension(pathExtension) ?? self
    }
}

// MARK: UIKit相关
extension String {
    ///通过字体获取字符串的尺寸
    func sizeWithFont(font : UIFont) -> CGSize {
        //如果没有内容
        guard self.empty == false else {
            return CGSizeZero
        }
        return self.nsstring.sizeWithAttributes([NSFontAttributeName : font])
    }
    ///通过字体和固定宽度计算字符串的高度
    func heightWithWidth(width : CGFloat, font : UIFont) -> CGFloat {
        //如果没有内容
        guard self.isEmpty == false else {
            return CGFloat(0)
        }
        let size = self.sizeWithFont(font)
        return (size.width / width) + size.height
    }
    
    func height(withConstrainedWidth width : CGFloat, andFont font : UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.max)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:  nil)
        
        return boundingBox.height
    }
    func width(withConstrainedHeight height : CGFloat, andFont font : UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.max, height: height)
        let boundingBox = self.boundingRectWithSize(constraintRect, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context:  nil)
        
        return boundingBox.width
    }
}

// MARK: 字符串的排序方法
extension String {
    /// 获取倒叙排序后的字符串，返回String
    var reverse : String {
        let characters = self.characters.map { (character) -> Character in
            return character
        }
        let reversed = characters.reverse()
        return String(reversed)
    }
}

// MARK: 字符串的分割方法
extension String {
    ///截取指定长度的字符串
    func substring(withStartPosition start : Int, andEndPosition end : Int) -> String {
        return self.substringWithRange(self.startIndex.advancedBy(start)..<self.startIndex.advancedBy(end))
    }
    ///根据指定长度均分字符串，返回[String]
    func split(equalWithLength length : Int) -> [String] {
        if length <= self.length && length > 0 {
            var array = [String]()
            
            var tempString = ""
            for (index, character) in self.characters.enumerate() {
                tempString.appendContentsOf("\(character)")
                if index % length == 1 {
                    array.append(tempString)
                    tempString = ""
                } else if index == self.characters.count - 1 {
                    array.append(tempString)
                    tempString = ""
                }
            }
            return array
        } else {
            let characters = self.characters.map({ (char) -> String in
                return String(char)
            })
            return characters
        }
    }
    ///根据字符分割字符串，返回[String]
    func split(withSeparator sepearator : Character) -> [String] {
        return self.characters.split(sepearator).map(String.init)
    }
}

// MARK: 其他
extension String {
    //MD5加密字符串
    func md5() -> String {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.destroy()
        return String(format: hash as String)
    }
}

extension String : Addable {
    
}

struct Pattern {
    var pattern : String
}
