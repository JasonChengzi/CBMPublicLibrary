//
//  UIScrollViewExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/16.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension UIScrollView {
    
    var contentHeight : CGFloat {
        get {
            return self.contentSize.height
        }
    }
    var contentWidth : CGFloat {
        get {
            return self.contentSize.width
        }
    }
    
}