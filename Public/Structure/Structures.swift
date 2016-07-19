//
//  Structures.swift
//  ModuleApplicationDemo
//
//  Created by Jason.Chengzi on 16/05/04.
//  Copyright © 2016年 WeSwift. All rights reserved.
//

import Foundation

struct ProjectDefaults {
    
    ///项目打包类型
    static let ARCHIVE_TYPE     : ArchiveType       = .DEBUGGING
    
    ///项目状态
    static var PROJECT_STATUS   : ProjectStatus {
        switch ARCHIVE_TYPE {
        case .DEBUGGING, .TESTING, .INHOUSE:
            return .DEVELOPING
        case .RELEASE:
            return .DISTRUBUTION
        }
    }
    ///服务器类型
    static var SERVER_TYPE      : ServerType {
        switch ARCHIVE_TYPE {
        case .DEBUGGING, .TESTING:
            return .INHOUSE
        case .INHOUSE:
            return .INHOUSE
        case .RELEASE:
            return .RELEASE
        }
    }
}

struct ApplicationDefaults {
    ///应用名称（中文）
    static let NAME_CHN                             = "儿童天使V"
    ///应用名称（英文）
    static let NAME_ENG                             = "ChildrenGardian"
    ///应用名称（缩写）
    static let NAME_SHORT                           = "CGN"
    ///应用版本（内部用）
    private static let VERSION_INHOUSE              = "1.0.0.0"
    ///应用版本（外部用）
    private static let VERSION_RELEASE              = "1.0.0.0"
    ///应用版本
    static var VERSION : String {
        switch ProjectDefaults.ARCHIVE_TYPE {
        case .DEBUGGING, .TESTING, .INHOUSE:
            return VERSION_INHOUSE
        case .RELEASE:
            return VERSION_RELEASE
        }
    }
    ///应用描述
    static let DESCRIPTION                          = ""
}

struct SystemDefaults {
    ///开关控制
    struct Switches {
        ///是否有广告图
        static let AD_ENABLE                : Bool  = false
        ///是否可以跳过广告图
        static var AD_SKIPPABLE             : Bool {
            if AD_ENABLE {
                return false
            }
            return AD_ENABLE
        }
        
        ///是否有引导图
        static let GUIDE_ENABLE             : Bool = false
        ///是否可以跳过引导图
        static var GUIDE_SKIPPABLE          : Bool {
            if GUIDE_ENABLE {
                return false
            }
            return GUIDE_ENABLE
        }
        
        ///是否需要先登录
        static let LOGIN_NECESSARY          : Bool = false
        ///是否允许游客方式
        static var LOGIN_ANONYMOUS_ENABLE   : Bool {
            if LOGIN_NECESSARY {
                return true
            }
            return LOGIN_NECESSARY
        }
        
        ///是否启用计步
        static let STEPCOUNTER_AVAILABLE    : Bool = true
    }
}

struct AppearenceDefaults {
    ///主题颜色
    static let COLOR_THEME                  : UIColor   = UIColor.colorWithRed(0, green: 179, blue: 160)
    ///配色1
    static let COLOR_SCHEME_ALPHA           : UIColor   = UIColor.whiteColor()
    ///配色2
    static let COLOR_SCHEME_BETA            : UIColor   = UIColor.yellowColor()
    ///配色3
    static let COLOR_SCHEME_GAMA            : UIColor   = UIColor.purpleColor()
    ///高亮颜色
    static let COLOR_SCHEME_HIGHTLIGHT      : UIColor   = UIColor.orangeColor()
    ///导航字体
    static let FONT_NAVIGATION_BAR          : UIFont    = UIFont.systemFontOfSize(16)
    ///导航字体颜色
    static let COLOR_TEXT_NAVIGATION_BAR    : UIColor = UIColor.whiteColor()
}

struct NetworkDefaults {
    ///服务器地址（通用）
    static var SERVER_ADDRESS           : String {
        switch ProjectDefaults.SERVER_TYPE {
        case .LOCALHOST:
            return "http://localhost"
        case .INHOUSE:
            return "http://test.hvit.com.cn"
        case .RELEASE:
            return ""
        }
    }
    ///服务器路径（通用）
    static var SERVER_ROUTE             : String {
        switch ProjectDefaults.SERVER_TYPE {
        case .LOCALHOST:
            return "/"
        case .INHOUSE:
            return "/ylserver/shop/mobile/"
        case .RELEASE:
            return ""
        }
    }
    ///服务器资源路径（通用）
    static var SERVER_ROUTE_RESOURCE    : String {
        switch ProjectDefaults.SERVER_TYPE {
        case .LOCALHOST:
            return "/"
        case .INHOUSE:
            return "/ylserver/public/"
        case .RELEASE:
            return ""
        }
    }
}

//MARK: - 第三方配置
struct ThirdPartyDefaults {
    //MARK: 友盟（UMeng）
    ///友盟配置
    struct UMeng {
        ///友盟通用AppKey
        static var AppKey_Default       : String {
            switch ProjectDefaults.PROJECT_STATUS {
            case .DEVELOPING:
                return "575cd44d67e58e7faf001879"
            case .DISTRUBUTION:
                return "575cd42fe0f55a537f002558"
            }
        }
        
        ///是否使用统计功能。默认：否
        static let Enable_Statistics    : Bool = true
        ///统计AppKey
        static var AppKey_Statistics    : String {
            return AppKey_Default
        }
        
        ///是否使用推送功能。默认：否
        static let Enable_Push          : Bool = false
        ///推送AppKey
        static var AppKey_Push          : String {
            return AppKey_Default
        }
        
        ///是否使用分享功能。默认：否
        static let Enable_Social        : Bool = false
        ///分享AppKey
        static var AppKey_Social        : String {
            return AppKey_Default
        }
        
        struct SocialWechat {
            static let Enable_Wechat    : Bool = false
            static var AppID            : String {
                return ""
            }
            static var AppSecret        : String {
                return ""
            }
            static var CallbackURL      : String {
                return ""
            }
        }
        struct SocialTencent {
            static let Enable_Tencent   : Bool = false
            static var AppID            : String {
                return ""
            }
            static var AppKey           : String {
                return ""
            }
            static var CallbackURL      : String {
                return ""
            }
        }
        struct SocialSina {
            static let Enable_Sina      : Bool = false
            static var AppID            : String {
                return ""
            }
            static var AppSecret        : String {
                return ""
            }
            static var CallbackURL      : String {
                return ""
            }
        }
    }
    
    //MARK: 百度（Baidu）
    ///百度配置
    struct Baidu {
        ///百度通用AppKey
        static var AppKey_Default       : String {
            //不区分开发、测试
            return "34GltVYVxAFrbyUtwsFd1UwIjSwxALHf"
        }
        
        ///是否使用地图功能。默认：否
        static let Enable_Map           : Bool = true
        ///地图AppKey
        static var AppKey_Map           : String {
            return AppKey_Default
        }
    }
    
    //MARK: Mob（Mob）
    ///Mob配置
    struct Mob {
        ///Mob通用AppKey
        static var AppKey_Default       : String {
            ///没有通用AppKey
            return ""
        }
        
        ///是否使用分享。默认：否
        static let Enable_Share         : Bool = false
        ///分享AppKey
        static var AppKey_Share         : String {
            switch ProjectDefaults.PROJECT_STATUS {
            case .DEVELOPING:
                return ""
            case .DISTRUBUTION:
                return ""
            }
        }
        
        ///是否使用短信验证。默认：否
        static let Enable_SMS           : Bool = true
        ///短信AppKey
        static var AppKey_SMS           : String {
//            return "13b86f0d53a98"
            return "81de4ff2ac9e"
        }
        ///短信Secret
        static var AppSecret_SMS        : String {
//            return "eba71f4432ac8b5acfd87e596513855e"
            return "7a3ebe233b66e0df2505eb54e1096f37"
        }
        
        ///是否使用开放API。默认：否
        static let Enable_API           : Bool = false
        ///开放APIAppKey
        static var AppKey_API           : String {
            return ""
        }
    }
    //MARK: 环信（Easemob）
    ///环信配置
    struct Easemob {
        ///Easemob通用AppKey
        static var AppKey_Default       : String {
            switch ProjectDefaults.PROJECT_STATUS {
            case .DEVELOPING:
                return ""
            case .DISTRUBUTION:
                return ""
            }
        }
        
        ///是否启用环信。默认：否
        static let Enable_Easemob       : Bool = false
        ///环信AppKey
        static var AppKey_Easemob       : String {
            return AppKey_Default
        }
    }
    //MARK: 极光（Jpush）
    ///极光配置
    struct JPush {
        ///JPush通用AppKey
        static var AppKey_Default       : String {
            switch ProjectDefaults.PROJECT_STATUS {
            case .DEVELOPING:
                return "0b3490e2787c8a742cc72202"
            case .DISTRUBUTION:
                return "81d7ac977b2f5dd2820e3ba9"
            }
        }
        
        ///是否启用极光推送。默认：否
        static let Enable_JPush         : Bool = false
        ///极光推送AppKey
        static var AppKey_JPush         : String {
            return AppKey_Default
        }
    }
}
