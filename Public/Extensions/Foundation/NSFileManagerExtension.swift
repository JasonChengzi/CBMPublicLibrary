//
//  NSFileManagerExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/16.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension NSFileManager {
    func isFileExisted(path : String) -> Bool {
        if self.fileExistsAtPath(path.toNSString.stringByDeletingLastPathComponent as String) {
            do {
                try self.createDirectoryAtPath(path.toNSString.stringByDeletingLastPathComponent as String, withIntermediateDirectories: true, attributes: nil)
            } catch {
                Log.logString("Create Audio Directory Exception Caught.")
            }
            return true
        } else {
            return false
        }
    }
}