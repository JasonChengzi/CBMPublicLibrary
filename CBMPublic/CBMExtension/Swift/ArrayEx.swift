import Foundation

extension Array {
    var firstElementIndex : Int { return 0 }
    var lastElementIndex : Int { return count - 1 }
}

extension Array {
    func isEmpty() -> Bool { return count <= 0 }
}

extension Array {
    subscript (r : Range<Int>) -> Array {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return self[startIndex..<endIndex]
        }
        set {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            let arrayRange = Range(uncheckedBounds: (lower: startIndex, upper: endIndex))
            replaceSubrange(arrayRange, with: newValue)
        }
    }
    mutating func remove<E>(element : E) where E : Equatable {
        self = self.filter{ $0 as? E != element }
    }
}

extension Array where Element : Hashable {
    /**
     * Remove duplicate elements from an array
     *
     * - returns: A new array without duplicates
     */
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
    
    /**
     * Remove duplicate elements from an array
     */
    mutating func duplicatesRemoved() {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

extension Sequence where Iterator.Element : CBMAddableProtocol {
    var sum : Iterator.Element { return reduce(Iterator.Element(), +) }
}
