//
//  UIImageViewExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension UIImageView {
    //链式设置
    override func makeBackgroundColor(color : UIColor?) -> UIImageView {
        self.backgroundColor = color
        return self
    }
    override func makeFrame(frame : CGRect) -> UIImageView {
        self.frame = frame
        return self
    }
    override func makeLayerCornerRadius(cornerRadius : CGFloat) -> UIImageView {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    override func makeLayerBorderUIColor(borderColor : UIColor?) -> UIImageView {
        self.layer.borderColor = borderColor?.CGColor
        return self
    }
    override func makeLayerMasksToBounds(masksToBounds : Bool) -> UIImageView {
        self.layer.masksToBounds = masksToBounds
        return self
    }
    override func makeClipsToBOunds(clipsToBounds : Bool) -> UIImageView {
        self.clipsToBounds = clipsToBounds
        return self
    }
    override func makeTranslatesAutoresizingMaskIntoConstraints(translate : Bool) -> UIImageView {
        self.translatesAutoresizingMaskIntoConstraints = translate
        return self
    }
    func makeAnimationDuration(duration : NSTimeInterval) -> UIImageView {
        self.animationDuration = duration
        return self
    }
}
