import Foundation

struct CBMStack<Element> {
    private(set) var items = [Element]()
    
    var topItem : Element? { return items.isEmpty ? nil : items[items.lastElementIndex] }
    
    mutating func push(item : Element) { items.append(item) }
    mutating func pop() throws -> Element {
        if items.isEmpty {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "No more item."])
        } else {
            return items.removeLast()
        }
    }
}

struct CBMQueue<Element> {
    private(set) var items = [Element]()
    mutating func push(item : Element) { items.append(item) }
    mutating func pop() throws -> Element {
        if items.isEmpty {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "No more item."])
        } else {
            return items.removeFirst()
        }
    }
}
