//
//  UITableViewExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/16.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension UITableView {
    ///滚动到底部
    func scrollToBottom(animated : Bool) {
        if self.contentHeight > self.viewHeight {
            let offSet = CGPoint(x: 0, y: self.contentHeight - self.viewHeight)
            self.setContentOffset(offSet, animated: animated)
        }
    }
}