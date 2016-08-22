//
//  OtherExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/27.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import Foundation

typealias GCD_Cancelable_Closure = (cancel : Bool) -> Void
struct GCD {
    
    /*
     * 延时执行
     * https://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
     */
    func perform(afterDelay delay : NSTimeInterval, andOperationClosure operation : Closure.empty) -> GCD_Cancelable_Closure? {
        func dispatch_later(perform : Closure.empty) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW
                    , Int64(delay * Double(NSEC_PER_SEC))),
                dispatch_get_main_queue(),
                operation
            )
        }
        
        var closure : dispatch_block_t? = operation
        var cancelableClosure : GCD_Cancelable_Closure?
        
        let delayedClosure : GCD_Cancelable_Closure = {
            cancel in
            if closure != nil {
                if (cancel == false) {
                    dispatch_async(dispatch_get_main_queue(), closure!)
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
        return cancelableClosure
    }
    
    func cancel(forDelayedClosure closure : GCD_Cancelable_Closure?) {
        
        if closure != nil {
            closure!(cancel: true)
        }
    }
}

struct Closure {
    /// () -> Void
    typealias empty = ()->Void
    /// (success : Bool) -> Void
    typealias success = (success : Bool) -> Void
    /// (finish : Bool) -> Void
    typealias finished = (finished : Bool) -> Void
}
