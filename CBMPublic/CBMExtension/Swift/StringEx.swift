import UIKit

extension String {
    var nsString : NSString { return self as NSString }
}

extension String {
    var length : Int { return characters.count }
}

extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return self[startIndex..<endIndex]
        }
        set {
            let startIndex = index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = index(self.startIndex, offsetBy: r.upperBound)
            let stringRange = Range<String.Index>(uncheckedBounds: (lower: startIndex, upper: endIndex))
            replaceSubrange(stringRange, with: newValue)
        }
    }
}

extension String {
    ///判断字符串是否无内容。(长度为0、""、"\0"、"\n")
    func isEmpty() -> Bool { return length == 0 || self == "" || self == "\0" || self == "\n" }
}

extension String {
    func toInt() -> Int? { return Int(self) }
    func toFloat() -> Float? { return Float(self) }
    func toDouble() -> Double? { return Double(self) }
    
    func toArray() -> [String] {
        return self.characters.map { return String($0) }
    }
}

extension String {
    mutating func insert(substring : String, at index : Int) {
        self = String(characters.prefix(index)) + substring + String(characters.suffix(characters.count - index))
    }
    
    func split(with sepearator : Character) -> [String] {
        return characters.split(separator: sepearator).map(String.init)
    }
    func split(with length : Int) -> [String] {
        guard length > 0 && length <= self.length else { return [self] }
        var array = [String]()
        
        var tempString = ""
        
        for (index, character) in characters.enumerated() {
            tempString.append(String(character))
            if index % length == 1 {
                array.append(tempString)
                tempString = ""
            } else if index == characters.count - 1 {
                array.append(tempString)
                tempString = ""
            }
        }
        return array
    }
}

extension String {
    func reverse() -> String {
        return String(characters.map { return $0 }.reversed())
    }
    mutating func reversed() {
        self = reverse()
    }
}

extension String {
    func height(with constrainedWidth : CGFloat, font : UIFont) -> CGFloat {
        let constraintRect = CGSize(width: constrainedWidth, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
        return boundingBox.height
    }
    func width(with constrainedHeight : CGFloat, font : UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: constrainedHeight)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : font], context: nil)
        return boundingBox.width
    }
}

extension String : CBMAddableProtocol {  }
