//
//  UIImageExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 8/5/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import UIKit

extension UIImage {
    static func image(fromColor color : UIColor, andImageSize size : CGSize?) -> UIImage {
        var imageSize = CGSize(width: 1, height: 1)
        if size != nil {
            imageSize = size!
        }
        
        UIGraphicsBeginImageContext(imageSize)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, CGRect(origin: CGPointZero, size: CGSize.zero))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}