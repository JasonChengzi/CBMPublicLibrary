import UIKit

extension CALayer {
    ///Get border color. Will return an optional UIColor instance.
    func borderUIColor() -> UIColor? {
        return borderColor == nil ? nil : UIColor(cgColor: borderColor!)
    }
    ///Set border color with UIColor instance.
    func setBorderUIColor(color : UIColor) {
        borderColor = color.cgColor
    }
}
