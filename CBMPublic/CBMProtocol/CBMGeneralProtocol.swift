import Foundation

protocol CBMAddableProtocol {
    init()
    
    static func + (lhs : Self, rhs : Self) -> Self
}
