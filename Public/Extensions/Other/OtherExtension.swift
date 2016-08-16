//
//  OtherExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/27.
//  Copyright © 2016年 Hvit. All rights reserved.
//


func inside (left : Int, right : (min : Int, max : Int)) -> Bool {
    if left <= right.max && left >= right.min {
        return true
    }
    return false
}

func inside (left : Float, right : (min : Float, max : Float)) -> Bool {
    if left <= right.max && left >= right.min {
        return true
    }
    return false
}

func inside (left : Double, right : (min : Double, max : Double)) -> Bool {
    if left <= right.max && left >= right.min {
        return true
    }
    return false
}

/*
 * 延时执行
 * https://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
 */
typealias dispatch_cancelable_closure = (cancel : Bool) -> Void

func performAfterDelay(delay : Double, closure:() -> Void) -> dispatch_cancelable_closure? {
    
    func dispatch_later(perform : () -> Void) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(),
            closure
        )
    }
    
    var closure : dispatch_block_t? = closure
    
    var cancelableClosure : dispatch_cancelable_closure?
    
    let delayedClosure:dispatch_cancelable_closure = { cancel in
        if closure != nil {
            if (cancel == false) {
                dispatch_async(dispatch_get_main_queue(), closure!);
            }
        }
        closure = nil
        cancelableClosure = nil
    }
    
    cancelableClosure = delayedClosure
    
    dispatch_later {
        if let delayedClosure = cancelableClosure {
            delayedClosure(cancel: false)
        }
    }
    
    return cancelableClosure;
}
func cancel_delay(closure : dispatch_cancelable_closure?) {
    
    if closure != nil {
        closure!(cancel: true)
    }
}


protocol Logable : CustomStringConvertible {
    init(dictionary : [String : AnyObject])
}

extension Logable where Self : AnyObject {
    var description : String {
        let mirror = Mirror.init(reflecting: self)
        var string = "\(mirror.subjectType){\n"
        for (key, value) in mirror.children {
            string += "\t\(key ?? "nil") : \(value ?? String("nil"))\n"
        }
        string += "}\n"
        return string
    }
    var debusDescription : String { return description }
}
