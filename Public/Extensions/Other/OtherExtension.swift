//
//  OtherExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/27.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import Foundation

typealias GCD_Cancelable_Closure = (cancel : Bool) -> Void
typealias GCD_Timer = dispatch_source_t
typealias GCD_Queue = dispatch_queue_t
struct GCD {
    static func getTimer(withQueue queue: dispatch_queue_t) -> GCD_Timer {
        return dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
    }
    /*
     * 延时执行
     * https://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
     */
    static func perform(afterDelay delay : NSTimeInterval, andOperationClosure operation : Closure.empty) -> GCD_Cancelable_Closure? {
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
    
    static func cancel(forDelayedClosure closure : GCD_Cancelable_Closure?) {
        
        if closure != nil {
            closure!(cancel: true)
        }
    }
    
    static func perform(asyncOnMainQuequeWithOperationClosure operation : dispatch_block_t) {
        dispatch_async(dispatch_get_main_queue(), operation)
    }
}
struct Dispatcher {
    typealias CancelableClosure = (cancel : Bool) -> Void
    typealias Closure = dispatch_block_t
    typealias Timer = dispatch_source_t
    typealias Queue = dispatch_queue_t
    
    static func performAsync(on queue: Queue, operation: Closure) {
        dispatch_async(queue, operation)
    }
    static func performAsync(onMainQueue operation: Closure) {
        performAsync(on: dispatch_get_main_queue(), operation: operation)
    }
}

struct Closure {
    /// () -> Void
    typealias empty = () -> Void
    /// (success : Bool) -> Void
    typealias success = (success : Bool) -> Void
    /// (finish : Bool) -> Void
    typealias finished = (finished : Bool) -> Void
    /// (error : NSError?) -> Void
    typealias error = (error : NSError?) -> Void
    /// (array: [AnyObject]?) -> Void
    typealias array = (array: [AnyObject]?) -> Void
    /// (dictionary: [String: AnyObject]?) -> Void
    typealias dictionary = (dictionary: [String: AnyObject]?) -> Void
    /// (dictionary: [String: AnyObject]?, array: [AnyObject]?) -> Void
    typealias mixed = (dictionary: [String: AnyObject]?, array: [AnyObject]?) -> Void
}

struct Method {
    static func toBeFinished(message: String? = nil, file: String? = #file, line: Int? = #line, column: Int? = #column, function: String? = #function) { debugCompleteLog("未完成的方法。【\(message)】。", file: file, line: line, column: column, function: function) }
    static func toBeHandledException(message: String? = nil, file: String? = #file, line: Int? = #line, column: Int? = #column, function: String? = #function) { debugCompleteLog("未处理的异常。【\(message)】。", file: file, line: line, column: column, function: function) }
}

struct Stack<Element> {
    private(set) var items = [Element]()
    var topItem : Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    mutating func push(item : Element) { items.append(item) }
    mutating func pop() throws -> Element {
        if items.isEmpty {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "No more item."])
        } else {
            return items.removeLast()
        }
    }
}
struct Queue<Element> {
    private(set) var items = [Element]()
    mutating func push(item : Element) { items.append(item) }
    mutating func pop() throws -> Element {
        if items.isEmpty {
            throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "No more item."])
        } else {
            return items.removeFirst()
        }
    }
}

// MARK: - Swift 3 style
typealias Date = NSDate
typealias Calendar = NSCalendar
typealias DateFormatter = NSDateFormatter
typealias FileManager = NSFileManager
typealias UserDefaults = NSUserDefaults
