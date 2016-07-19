//
//  SystemTool.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/13.
//  Copyright © 2016年 Hvit. All rights reserved.
//

import UIKit
import AddressBook

struct System {
    @available(iOS 8.0, *)
    static func OpenSettings() {
        if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    struct Permission {
        static func requestAddressBookPermission(addressBook : ABAddressBook, onEventPermissionGranted : (() -> Void)?, onEventPermissionNotGranted : (() -> Void)?) {
            ABAddressBookRequestAccessWithCompletion(addressBook) { (granted : Bool, error : CFError!) in
                
            }
        }
    }
}