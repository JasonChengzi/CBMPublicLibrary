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
}
