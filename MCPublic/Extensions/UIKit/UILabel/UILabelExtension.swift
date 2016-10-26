//
//  UILabelExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension UILabel {
    ///依据文本内容改变标签的高度
    func updateHeightWithContent(content : String) {
        let height = content.heightWithWidth(self.viewWidth, font: self.font)
        self.viewSize = CGSize(width: self.viewWidth, height: height)
    }
    ///如果需要，就自动调整高度
    func setHeightFitIfNeed() {
        guard let text = self.text else {
            return
        }
        self.viewSize = CGSize(width: self.viewWidth, height: text.heightWithWidth(self.viewWidth, font: self.font))
    }
    
    // MARK: 链式设置
    override func makeBackgroundColor(color : UIColor?) -> UILabel {
        self.backgroundColor = color
        return self
    }
    override func makeFrame(frame : CGRect) -> UILabel {
        self.frame = frame
        return self
    }
    override func makeLayerCornerRadius(cornerRadius : CGFloat) -> UILabel {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    override func makeLayerBorderUIColor(borderColor : UIColor?) -> UILabel {
        self.layer.borderColor = borderColor?.CGColor
        return self
    }
    override func makeLayerMasksToBounds(masksToBounds : Bool) -> UILabel {
        self.layer.masksToBounds = masksToBounds
        return self
    }
    override func makeTranslatesAutoresizingMaskIntoConstraints(translate : Bool) -> UILabel {
        self.translatesAutoresizingMaskIntoConstraints = translate
        return self
    }
    func makeText(text : String?) -> UILabel {
        self.text = text
        return self
    }
    func makeFont(font : UIFont!) -> UILabel {
        self.font = font
        return self
    }
    func makeTextColor(textColor : UIColor!) -> UILabel {
        self.textColor = textColor
        return self
    }
    func maketextAlignment(textAlignment : NSTextAlignment) -> UILabel {
        self.textAlignment = textAlignment
        return self
    }
    func makeNumberOfLines(number : Int) -> UILabel {
        self.numberOfLines = number
        return self
    }
}
