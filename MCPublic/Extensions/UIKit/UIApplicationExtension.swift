//
//  UIApplicationExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension UIApplication {
    var displayingWindow : UIWindow? {
        guard self.keyWindow == nil else {
            return self.keyWindow
        }
        guard self.windows.last == nil else {
            return self.windows.last
        }
        guard self.delegate!.window == nil else {
            return self.delegate!.window!
        }
        return nil
    }
}
