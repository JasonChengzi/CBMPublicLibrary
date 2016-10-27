import Foundation

// MARK: - 初始化方法
extension Bool {
    ///用字符串初始化，"1"-true, 其他-false
    init(string : String) { if string == "1" { self = true } else { self = false } }
    ///用整形初始化，1-true, 其他-false
    init(integer : Int) { if integer == 1 { self = true } else { self = false } }
}

extension Bool {
    func toString() -> String { return self == true ? "1" : "0" }
    func toInteger() -> Int { return self == true ? 1 : 0 }
}

extension Bool {
    func opposite() -> Bool { return !self }
    mutating func opposited() { self = !self }
}
