//
//  CALayerExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension CALayer {
    ///获取border的颜色
    func borderUIColor() -> UIColor? {
        return borderColor != nil ? UIColor(CGColor: borderColor!) : nil
    }
    ///便捷设置Border颜色
    func setBorderUIColor(color : UIColor) {
        borderColor = color.CGColor
    }
    
    // MARK: 链式设置
    func makeBackgroundColor(color : UIColor?) -> CALayer {
        self.backgroundColor = color?.CGColor
        return self
    }
    func makeFrame(frame : CGRect) -> CALayer {
        self.frame = frame
        return self
    }
    func makeSize(size : CGSize) -> CALayer {
        self.frame.size = size
        return self
    }
    func makeAnchorPoint(point : CGPoint) -> CALayer {
        self.anchorPoint = point
        return self
    }
    func makePosition(position : CGPoint) -> CALayer {
        self.position = position
        return self
    }
}
