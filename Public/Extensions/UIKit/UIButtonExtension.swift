//
//  UIButtonExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension UIButton {
    ///设置NormalState时的标题文字
    func setNormalTitle(title : String?) -> UIButton {
        self.setTitle(title, forState: UIControlState.Normal)
        return self
    }
    ///设置NormalState时的文字颜色
    func setNormalTitleColor(color : UIColor) -> UIButton {
        self.setTitleColor(color, forState: UIControlState.Normal)
        return self
    }
    ///设置NormalState时的图片
    func setNormalBackgroundImage(image : UIImage?) -> UIButton {
        self.setBackgroundImage(image, forState: UIControlState.Normal)
        return self
    }
    
    ///设置Highlighted时的标题文字
    func setHighlightedTitle(title : String?) -> UIButton {
        self.setTitle(title, forState: UIControlState.Highlighted)
        return self
    }
    ///设置Highlighted时的标题文字颜色
    func setHighlightedTitleColor(color : UIColor) -> UIButton {
        self.setTitleColor(color, forState: UIControlState.Highlighted)
        return self
    }
    
    ///设置标题文字的字体
    func setTitleFont(font : UIFont) -> UIButton {
        self.titleLabel?.font = font
        return self
    }
    ///设置标题文字的字体字号
    func setTitleFontSize(size : CGFloat) -> UIButton {
        if let font = self.titleLabel?.font {
            self.titleLabel?.font = UIFont(name: font.fontName, size: size)
        }
        return self
    }
}