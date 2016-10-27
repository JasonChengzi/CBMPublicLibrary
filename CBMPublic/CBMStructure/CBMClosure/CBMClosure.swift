import Foundation

struct CBMClosure {
    typealias empty = () -> Void
    
    typealias error = (_ error : Error?) -> Void
    
    typealias success = (_ success : Bool) -> Void
    
    typealias finished = (_ finished : Bool) -> Void
    
    typealias cancelable = (_ cancel : Bool) -> Void
}
