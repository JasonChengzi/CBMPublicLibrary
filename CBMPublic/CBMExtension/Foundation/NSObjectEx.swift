import Foundation

extension NSObject {
    static var className : String {
        return String(describing: self)
    }
    var className : String {
        return NSStringFromClass(self.classForCoder)
    }
}
