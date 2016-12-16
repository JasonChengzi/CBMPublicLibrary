//
//  Api.swift
//  CunXin-Staff
//
//  Created by Jason.Chengzi on 16/04/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//

import UIKit

enum Api {
    
    ///002 会员注册
    case Register(username : String, password : String, code : String)
    
    ///001 会员登录
    case Login(username : String, password : String)
    
    ///004 会员登出
    case Logout(userID : String, token : String)
    
    ///010 获取忘记密码验证码
    case RequestPhoneValidatingCode(phone : String)
    
    ///008 忘记密码
    case RetrievePassword(phone : String, validateCode : String, newPassword : String)
    
    ///014 修改密码
    case ChangePassword(userID : String, token : String, password : String, newPassword : String)
    
    ///043 用户意见反馈
    case SubmitFeedback(token : String, content : String, image : NSData)
    
    ///034 获得轮播广告图片url
    case RequestAdBannerImagesURL
    
    ///返回封装后的Api
    private var package : ApiPackage {
        
        let uncompletedUrl                                      = Project.Network.Server.HTTP.address
        
        switch self {
        case .Register(let username, let password, let code):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?act=member&op=register&access_token=token",
                params: [
                    ApiParameterKey.MobilePhoneNumber           : username,
                    ApiParameterKey.Password                    : password.md5(),
                    ApiParameterKey.ConfirmPassword_Retrieving  : password.md5(),
                    ApiParameterKey.ValidateCodeNumber          : code,
                    ApiParameterKey.ClientType                  : ApiParameterKey.DEVICE_TYPE_iOS,
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "注册"
            )
        case .Login(let username, let password):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?act=member&op=login&access_token=token",
                params: [
                    ApiParameterKey.Username                    :   username,
                    ApiParameterKey.Password                    :   password.md5(),
                    ApiParameterKey.UserCharacter               :   0,
                    ApiParameterKey.ClientType                  :   ApiParameterKey.DEVICE_TYPE_iOS,
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "登陆"
            )
        case .Logout(let userID, let token):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?act=member&op=logout&access_token=token",
                params: [
                    ApiParameterKey.ID                          : userID,
                    ApiParameterKey.Token                       : token,
                    ApiParameterKey.ClientType                  : ApiParameterKey.DEVICE_TYPE_iOS,
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "登出"
            )
        case .RequestPhoneValidatingCode(let phone):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?access_token=token&act=member&op=getForgotCode",
                params: [
                    ApiParameterKey.MobilePhoneNumber           : phone,
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "获取手机验证码"
            )
        case .RetrievePassword(let phone, let validateCode, let newPassword):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?access_token=token&act=member&op=forgot",
                params: [
                    ApiParameterKey.MobilePhoneNumber           : phone,
                    ApiParameterKey.ValidateCodeNumber          : validateCode,
                    ApiParameterKey.Password                    : newPassword.md5(),
                    ApiParameterKey.ConfirmPassword_Retrieving  : newPassword.md5(),
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "找回密码"
            )
        case .ChangePassword(let userID, let token, let password, let newPassword):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?access_token=token&act=member&op=changepassword",
                params: [
                    ApiParameterKey.MemberID                    : userID,
                    ApiParameterKey.Token                       : token,
                    ApiParameterKey.OldPassword                 : password.md5(),
                    ApiParameterKey.NewPassword                 : newPassword.md5(),
                    ApiParameterKey.ConfirmPassword_Changing    : newPassword.md5(),
                    ApiParameterKey.ClientType                  : ApiParameterKey.DEVICE_TYPE_iOS,
                    ApiParameterKey.AppType                     : ApiParameterKey.APP_TYPE_CGN
                ],
                data: [],
                name: "修改密码"
            )
        case .SubmitFeedback(let token, let content, let imageData):
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?act=member_feedback&op=member_feedback_add&access_token=token",
                params: [
                    ApiParameterKey.Token               : token,
                    ApiParameterKey.ClientType          : ApiParameterKey.DEVICE_TYPE_iOS,
                    ApiParameterKey.Content_Feedback    : content,
                    ApiParameterKey.AppVersion_Feedback : "",
                    ApiParameterKey.AppType_Feedback    : ApiParameterKey.APP_TYPE_CGN,
                    "sys"                               : "3"
                ],
                data: [imageData],
                name: "意见反馈"
            )
        case .RequestAdBannerImagesURL:
            return ApiPackage(
                url: uncompletedUrl + Project.Network.Server.HTTP.route_old_sys + "?access_token=token&act=baseconf&op=get_pic_cofn",
                params: [
                    "bc_uses_type"  : 1,
                    "bc_type"       : 3
                ],
                data: [],
                name: "获取轮播图路径"
            )
        }
    }
    
    var url : String {
        return self.package.url
    }
    
    var params : [String : AnyObject] {
        return self.package.params
    }
    
    var data : [NSData] {
        return self.package.data
    }
    
    var apiName : String {
        return self.package.name
    }
}

struct ApiPackage {
    var url : String
    var params : [String : AnyObject]
    var data : [NSData]
    var name : String
}

struct ApiParameterKey {
    static let Username                     =   "username"          //用户名
    static let Password                     =   "password"          //密码
    static let ConfirmPassword_Retrieving   =   "password_confirm"  //确认新密码
    static let OldPassword                  =   "oldpassword"       //旧密码
    static let NewPassword                  =   "newpassword"       //新密码
    static let ConfirmPassword_Changing     =   "ckpassword"        //确认新密码
    
    static let UserCharacter                =   "role"              //角色
    static let Token                        =   "key"               //令牌
    static let MemberID                     =   "member_id"         //用户ID
    static let ID                           =   "id"                //ID
    
    
    static let MobilePhoneNumber            =   "mobile"            //手机号码
    static let ValidateCodeNumber           =   "code"              //手机验证码
    
    static let ClientType                   =   "client"            //设备，默认 DEVICE_TYPE_iOS
    static let AppType                      =   "type"              //App类型，默认 DEVICE_TYPE_iOS
    
    static let Content_Feedback             =   "content"           //反馈内容
    static let AppVersion_Feedback          =   "app_version"       //App版本号
    static let AppType_Feedback             =   "app_type"          //App类型，默认 APP_TYPE_CGN
    static let Picture_Feedback             =   "pic"               //
    
    static let DEVICE_TYPE_iOS              =   "ios"               //设备类型，iOS
    static let APP_TYPE_CGN                 =   "3"                 //App标志位，3：H+
}
