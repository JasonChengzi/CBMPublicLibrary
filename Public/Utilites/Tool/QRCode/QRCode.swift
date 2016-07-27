//
//  QRCode.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 7/20/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import UIKit

class QRCode: NSObject {
    class func generateQRCodeWithText(text : String, imageSize : CGSize) -> UIImage? {
        guard text.length > 0 else {
            Log.logString("QRCode：生成二维码的内容不能为空。")
            return nil
        }
        
        guard let data = text.dataUsingEncoding(NSUTF8StringEncoding) else {
            Log.logString("QRCode：生成二维码出错。")
            return nil
        }
        
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else {
            Log.logString("QRCode：生成二维码出错。")
            return nil
        }
        
        filter.setValue(data, forKey: "inputMessage")
        
        guard let outputImage = filter.outputImage else {
            Log.logString("QRCode：生成二维码出错。")
            return nil
        }
        
        let scale = imageSize.width / CGRectGetWidth(outputImage.extent)
        let transform = CGAffineTransformMakeScale(scale, scale)
        
        let transformImage = outputImage.imageByApplyingTransform(transform)
        
        Log.logString("QRCode：成功生成二维码图片")
        return UIImage(CIImage: transformImage)
    }
}
