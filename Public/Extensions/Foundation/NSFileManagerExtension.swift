//
//  NSFileManagerExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/16.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension NSFileManager {
    func isFileExisted(path : String) -> Bool {
        if self.fileExistsAtPath(path.nsstring.stringByDeletingLastPathComponent as String) {
            do {
                try self.createDirectoryAtPath(path.nsstring.stringByDeletingLastPathComponent as String, withIntermediateDirectories: true, attributes: nil)
            } catch {
                debugLog("Create Audio Directory Exception Caught.")
            }
            return true
        } else {
            return false
        }
    }
}