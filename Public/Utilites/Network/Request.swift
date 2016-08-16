//
//  Request.swift
//  CunXin-Staff
//
//  Created by Jason.Chengzi on 16/04/17.
//  Copyright © 2016年 Hvit. All rights reserved.
//

import UIKit

typealias   ProgressCallbackClosure         =   ((progress : NSProgress) -> Void)
typealias   NetworkUnenabledCallbackClosure =   (() -> Void)
typealias   ServerUnenabledCallbackClosure  =   (() -> Void)
typealias   SuccessCallbackClosure          =   ((result : Result) -> Void)
typealias   FailureCallbackClosure          =   ((result : Result) -> Void)

enum Request {
    case GET(
        api                         :   Api,
        progressCallbackClosure     :   ProgressCallbackClosure?,
        networkUnenbledClosure      :   NetworkUnenabledCallbackClosure?,
        serverUneabledClosure       :   ServerUnenabledCallbackClosure?,
        successCallbackClosure      :   SuccessCallbackClosure?,
        failureCallbackClosure      :   FailureCallbackClosure?
    )
    case POST(
        api                         :   Api,
        progressCallbackClosure     :   ProgressCallbackClosure?,
        networkUnenbledClosure      :   NetworkUnenabledCallbackClosure?,
        serverUneabledClosure       :   ServerUnenabledCallbackClosure?,
        successCallbackClosure      :   SuccessCallbackClosure?,
        failureCallbackClosure      :   FailureCallbackClosure?
    )
    case UPLOAD(
        api                         :   Api,
        name                        :   String,
        fileName                    :   String,
        mimeType                    :   String,
        progressCallbackClosure     :   ProgressCallbackClosure?,
        networkUnenbledClosure      :   NetworkUnenabledCallbackClosure?,
        serverUneabledClosure       :   ServerUnenabledCallbackClosure?,
        successCallbackClosure      :   SuccessCallbackClosure?,
        failureCallbackClosure      :   FailureCallbackClosure?
    )
    
    var PROCESS : Void {
        switch self {
        case .GET(let api, let progressClosure, let networkClosure, let serverClosure, let successClosure, let failureClosure):
            
            guard self.willSubmitRequest(api) == true else {
                if let closure = networkClosure {
                    closure()
                }
                break
            }
            
            AFHTTPSessionManager(
                sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration()
                ).GET(
                    api.url,
                    parameters: api.params,
                    progress: progressClosure,
                    success: {
                        (dataTask : NSURLSessionDataTask, responseObject : AnyObject?) in
                        let result = self.processData(api, responseObject: responseObject, responseError: nil)
                        
                        self.didSubmitRequest(api, responseObject: responseObject, responseError: nil, result: result)
                        
//                        if result.code == .NeedsReLogin {
//                            if let userVM = CentralProcessor.fetchViewModel(UserViewModel) as? UserViewModel {
//                                userVM.needsRelogin()
//                            }
//                        } else {
                            if let closure = successClosure {
                                
                                closure(result: result)
                            }
//                        }
                    },
                    failure: {
                        (dataTask : NSURLSessionDataTask?, responseError : NSError) in
                        
                        let result = self.processData(api, responseObject: nil, responseError: responseError)
                        
                        self.didSubmitRequest(api, responseObject: nil, responseError: responseError, result: result)
                            
                        if let closure = serverClosure {
                            closure()
                        }
                        if let closure = failureClosure {
                            
                            closure(result: result)
                        }
                    }
            )
        case .POST(let api, let progressClosure, let networkClosure, let serverClosure, let successClosure, let failureClosure):
            /*
             AFHTTPSessionManager(
             sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration()
             ).POST(
             api.url,
             parameters: api.params,
             progress: progressClosure,
             success: successClosure,
             failure: failureClosure
             )
             */
            guard self.willSubmitRequest(api) == true else {
                if let closure = networkClosure {
                    closure()
                }
                break
            }
            AFHTTPSessionManager(
                sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration()
                ).POST(
                    api.url,
                    parameters: api.params,
                    progress: progressClosure,
                    success: {
                        (dataTask : NSURLSessionDataTask, responseObject : AnyObject?) in
                        let result = self.processData(api, responseObject: responseObject, responseError: nil)
                        
                        self.didSubmitRequest(api, responseObject: responseObject, responseError: nil, result: result)
                        
//                        if result.code == .NeedsReLogin {
//                            if let userVM = CentralProcessor.fetchViewModel(UserViewModel) as? UserViewModel {
//                                userVM.needsRelogin()
//                            }
//                        } else {
                            if let closure = successClosure {
                                
                                closure(result: result)
                            }
//                        }
                    },
                    failure: {
                        (dataTask : NSURLSessionDataTask?, responseError : NSError) in
                        
                        let result = self.processData(api, responseObject: nil, responseError: responseError)
                        
                        self.didSubmitRequest(api, responseObject: nil, responseError: responseError, result: result)
                        
                        if let closure = serverClosure {
                            closure()
                        }
                        if let closure = failureClosure {
                            
                            closure(result: result)
                        }
                    }
            )
        case .UPLOAD(let api, let name, let fileName, let mimeType, let progressClosure, let networkClosure, let serverClosure, let successClosure, let failureClosure):
            guard self.willSubmitRequest(api) == true else {
                if let closure = networkClosure {
                    closure()
                }
                break
            }
            AFHTTPSessionManager(
                sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration()
                ).POST(
                    api.url,
                    parameters: api.params,
                    constructingBodyWithBlock: {
                        (formData : AFMultipartFormData) -> Void in
                        let dataArray = api.data
                        if dataArray.count > 1 {
                            for (index, data) in dataArray.enumerate() {
                                formData.appendPartWithFileData(
                                    data,
                                    name: "\(name)\(index + 1)",
                                    fileName: "\(fileName)\(index + 1).png",
                                    mimeType: mimeType
                                )
                            }
                        } else {
                            formData.appendPartWithFileData(
                                dataArray.first!,
                                name: name,
                                fileName: fileName,
                                mimeType: mimeType
                            )
                        }
                    },
                    progress: progressClosure,
                    success: {
                        (dataTask : NSURLSessionDataTask, responseObject : AnyObject?) in
                        let result = self.processData(api, responseObject: responseObject, responseError: nil)
                        
                        self.didSubmitRequest(api, responseObject: responseObject, responseError: nil, result: result)
                        
//                        if result.code == .NeedsReLogin {
//                            if let userVM = CentralProcessor.fetchViewModel(UserViewModel) as? UserViewModel {
//                                userVM.needsRelogin()
//                            }
//                        } else {
                            if let closure = successClosure {
                                
                                closure(result: result)
                            }
//                        }
                    },
                    failure: {
                        (dataTask : NSURLSessionDataTask?, responseError : NSError) in
                        
                        let result = self.processData(api, responseObject: nil, responseError: responseError)
                        
                        self.didSubmitRequest(api, responseObject: nil, responseError: responseError, result: result)
                        
                        if let closure = serverClosure {
                            closure()
                        }
                        if let closure = failureClosure {
                            
                            closure(result: result)
                        }
                    }
            )
        }
    }
    
    func willSubmitRequest(api : Api) -> Bool {
        debugLog("接口：\(api.apiName)\n即将提交的数据：\n路径：\(api.url)\n参数：\(api.params.toString)")
        
        return true
        /*
        if Reachability.connectedToNetwork() {
            return true
        } else {
            
            SVProgressHUD.showErrorWithStatus("当前网络不可用")
            
            return false
        }
        */
    }
    func didSubmitRequest(api : Api, responseObject : AnyObject?, responseError : NSError?, result : Result?) {
        debugLog("接口：\(api.apiName)\n返回的内容：\n错误：\(responseError)\n数据：\(responseObject)")
    }
    
    func processData(api : Api, responseObject : AnyObject?, responseError : NSError?) -> Result {
        if let error = responseError {
            return Result(isSucceeded: false, code: .Failure, message: error.localizedDescription, data: nil)
        }
        var isSucceeded = false
        var code        = ResponseCode.Unknown
        var message     : String?
        var data        : [String : AnyObject]?
        if let object = responseObject {
            //解析ResponseObject
            //若为词典，进一步解析
            if let dictionary = object as? [String : AnyObject] {
                //获取Code字段，若不为空进一步解析
                if let anyCode = dictionary[ResponseParameterKey.Code] {
                    //将Code转换为整型
                    var intCode : Int?
                    if anyCode as? Int != nil {
                        intCode = (anyCode as! Int)
                    }
                    if anyCode as? String != nil {
                        if (anyCode as! String).isInt {
                            intCode = (anyCode as! String).toInt
                        }
                    }
                    if intCode != nil {
                        code = ResponseCode(rawValue: intCode!) ?? ResponseCode.Unknown
                        message = code.message
                        if code == .Success {
                            isSucceeded = true
                            //获取Data字段
                            if let anyData = dictionary[ResponseParameterKey.Data] {
                                if let arrayData = anyData as? [AnyObject] {
                                    data = Dictionary()
                                    data![ResponseParameterKey.List] = arrayData
                                } else if let dictData = anyData as? [String : AnyObject] {
                                    data = dictData
                                } else {
                                    data = Dictionary()
                                    data![ResponseParameterKey.Data] = anyData
                                }
                            }
                        } else {
                            if let anyMessage = dictionary[ResponseParameterKey.MessageError] {
                                if let stringMessage = anyMessage as? String {
                                    message = stringMessage
                                }
                            }
                        }
                    } else {
                        code = .Unexpected
                        message = code.message
                    }
                } else {
                    code = .Unexpected
                    message = code.message
                }
            } else {
                code = .Unexpected
                message = code.message
            }
        } else {
            code = .Failure
            message = code.message
        }
        return Result(isSucceeded: isSucceeded, code: code, message: message, data: data)
    }
}

struct Result {
    ///网络请求是否成功
    var isSucceeded     : Bool
    ///服务器返回代号
    var code            : ResponseCode
    ///服务器返回消息
    var message         : String?
    ///服务器返回数据
    var data            : [String : AnyObject]?
    
    func toString() -> String {
        return "\((isSucceeded ? "Succeeded" : "Failure"))\ncode:\(code)\nmessage:\(message ?? "没有消息。")\ndata:\(data != nil ? data!.toString : "没有数据")"
    }
}

struct ResponseParameterKey {
    static let Code         =   "code"
    static let Data         =   "datas"
    static let MessageError =   "errorMsg"
    static let List         =   "list"
}

enum ResponseCode : Int {
    case Success = 0
    case InvaildUser = 10001
    case InCorrectParams = 11010
    case TooMuchRequest = 11011
    case NeedsReLogin = 12002
    case InvalidUsername = 16001
    
    case EmptyData = 17001
    
    case Unknown = -1
    case Failure = -2
    case Unexpected = -3
    case NetworkUnenabled = -4
    case ServerUnreachable = -5
    
    var message : String {
        switch self {
        case .Success:
            return "请求成功"
        case .InvaildUser:
            return "用户名或密码错误"
        case .InCorrectParams:
            return "请求参数错误"
        case .TooMuchRequest:
            return "请求操作太过频繁"
        case .NeedsReLogin:
            return "请重新登录"
        case .InvalidUsername:
            return "账号不存在"
        case .EmptyData:
            return "没有数据"
            
        case .Unknown:
            return "未知错误"
        case .Failure:
            return "请求失败"
        case .Unexpected:
            return "服务器返回数据异常"
        case .NetworkUnenabled:
            return "网络不可用"
        case .ServerUnreachable:
            return "服务器连接失败"
        }
    }
}