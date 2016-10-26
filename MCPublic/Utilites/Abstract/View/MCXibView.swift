//
//  MCXibView.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//

import UIKit

@IBDesignable class MCXibView: UIView {
    // MARK: - Static
    // MARK: Private
    
    // MARK: Public
    
    // MARK: - Instance
    // MARK: Private
    
    // MARK: Public
    
    // MARK: - UIKit
    // MARK: Storyboard
    
    // MARK: Custom
    @IBInspectable var xibFileName : String?
    // MARK: - Override
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
//        super.awakeFromNib()
        guard let xibFileName = self.xibFileName else {
            return
        }
        guard xibFileName != "" && xibFileName != " " else {
            return
        }
        guard let xibFile = NSBundle.mainBundle().loadNibNamed(xibFileName, owner: self, options: nil) else {
            return
        }
        guard let xibViews = xibFile as? [UIView] where xibViews.count > 0 else {
            return
        }
        self.addSubview(xibViews.first!)
    }
}
// MARK: - Selector / Callback                  （响应，回调方法）
//extension AnyClass {}

// MARK: - Private Action / Instance Action     （私有方法）
//extension AnyClass {}

// MARK: - Public Action / Class Action         （公共方法）
//extension AnyClass {}
// MARK: - Protocol / Delegate / DataSource     （协议，代理，数据源实现方法）
//extension AnyClass : AnyProtocol {}

// MARK: - Updater (Update UIKit)               （更新控件的方法）
//extension AnyClass {}

// MARK: - Setter / Setup                       （设置方法）
//extension AnyClass {}

// MARK: - Getter / Judgement                   （获取方法）
//extension AnyClass {}

// MARK: - Structure / Enumeration              （结构体、枚举的定义）
// MARK: - Other                                （其他）