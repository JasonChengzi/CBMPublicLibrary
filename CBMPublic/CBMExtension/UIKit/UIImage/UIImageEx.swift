import UIKit

extension UIImage {
    static func QRCodeImage(with text : String, imageSize : CGSize) -> UIImage? {
        guard text.length > 0 else {
//            CBMDebugLog.print("")
            return nil
        }
        guard let data = text.data(using: .utf8) else {
            return nil
        }
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        
        filter.setValue(data, forKey: "inputMessage")
        
        guard let outputImage = filter.outputImage else {
            return nil
        }
        
        let scale = imageSize.width / outputImage.extent.width
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        
        let transformImage = outputImage.applying(transform)
        
        return UIImage(ciImage: transformImage)
    }
}

