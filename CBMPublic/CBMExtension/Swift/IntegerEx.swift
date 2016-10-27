import Foundation

extension Int {
    subscript(digitIndex : Int) -> Int {
        get {
            var decimalBase = 1
            for _ in 0..<digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
        }
    }
    
    static func random(from start : Int, to end : Int) -> Int { return start + (Int(arc4random()) % (end - start)) }
}

extension Int : CBMAddableProtocol { }
