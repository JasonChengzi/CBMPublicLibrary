//
//  Enumerations.swift
//  ModuleApplicationDemo
//
//  Created by Jason.Chengzi on 16/05/04.
//  Copyright © 2016年 WeSwift. All rights reserved.
//

import Foundation

//项目状态
enum ProjectStatus {
    ///开发中
    case DEVELOPING
    ///发布中
    case DISTRUBUTION
}
//打包类型
enum ArchiveType {
    ///调试
    case DEBUGGING
    ///内测版
    case TESTING
    ///公测版
    case INHOUSE
    ///正式版
    case RELEASE
    
    var stringValue : String {
        switch self {
        case .DEBUGGING:
            return "Debug"
        case .TESTING:
            return "Test"
        case .INHOUSE:
            return "In House"
        case .RELEASE:
            return "App Store"
        }
    }
}
//服务器类型
enum ServerType {
    ///本地服务器
    case LOCALHOST
    ///内网服务器
    case INHOUSE
    ///外网服务器
    case RELEASE
}