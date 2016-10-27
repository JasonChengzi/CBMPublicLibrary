import UIKit

struct CBMQRCode {
    static func generateQRCodeImage(with text : String, imageSize : CGSize) -> UIImage? {
        return UIImage.QRCodeImage(with: text, imageSize: imageSize)
    }
}
