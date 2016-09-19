//
//  ArrayExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension Array {
    var toString : String {
        var stringToReturn = ""
        for (index, object) in self.enumerate() {
            stringToReturn += "\(index): \(object)\n"
        }
        return stringToReturn
    }
    
    var isEmpty : Bool {
        if self.count <= 0 {
            return true
        } else {
            return false
        }
    }
    
    var hasElement : Bool {
        return !isEmpty
    }
    
    /// 数组第一位的下标
    var firstIndex : Int {
        return 0
    }
    
    /// 数组最后一位的下标
    var lastIndex : Int {
        guard self.count != 0 else {
            return 0
        }
        
        return self.count - 1
    }
    
    var toSQLString : (parametersString : String, questionMarksString : String) {
        var parameters = "("
        var questionMarks = "("
        if self.count > 0 {
            for (index, string) in self.enumerate() {
                parameters = parameters.stringByAppendingString("\(string)")
                questionMarks = questionMarks.stringByAppendingString("?")
                
                if index != self.count - 1 {
                    parameters = parameters.stringByAppendingString(", ")
                    questionMarks = questionMarks.stringByAppendingString(", ")
                } else if index == self.count - 1 {
                    parameters = parameters.stringByAppendingString(")")
                    questionMarks = questionMarks.stringByAppendingString(")")
                }
            }
        } else {
            parameters = ""
            questionMarks = ""
        }
        return (parameters, questionMarks)
    }
    
    mutating func remove<T where T : Equatable>(element : T) {
        self = self.filter({
            $0 as? T != element
        })
    }
    
    func subarray(toEndWithStartIndex startIndex : Int) -> Array {
        return self.subarray(withStartIndex: startIndex, andEndIndex: self.lastIndex)
    }
    func subarray(fromHeadWithEndIndex endIndex : Int) -> Array{
        return self.subarray(withStartIndex: 0, andEndIndex: endIndex)
    }
    func subarray(fromHeadWithLength length : Int) -> Array {
        if length < self.count {
            return self.subarray(fromHeadWithEndIndex: length - 1)
        } else {
            return self
        }
    }
    func subarray(toEndWithLength length : Int) -> Array {
        return self.subarray(toEndWithStartIndex: self.lastIndex - (length - 1))
    }
    func subarray(fromStartIndex startIndex : Int, andLength length : Int) -> Array {
        return self.subarray(withStartIndex: startIndex, andEndIndex: startIndex + length - 1)
    }
    func subarray(withStartIndex startIndex : Int, andEndIndex endIndex : Int) -> Array {
        guard self.count > 0 else {
            return Array()
        }
        if startIndex > self.lastIndex {
            return Array()
        } else if endIndex > self.lastIndex {
            let arraySlice = self[startIndex...self.lastIndex]
            return Array(arraySlice)
        } else {
            let arraySlice = self[startIndex...endIndex]
            return Array(arraySlice)
        }
    }
}
extension Array where Element: Hashable {
    /**
     * Remove duplicate elements from an array
     *
     * - returns: A new array without duplicates
     */
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        return result
    }
    
    /**
     * Remove duplicate elements from an array
     */
    mutating func removeDuplicatesInPlace() {
        var result: [Element] = []
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}

extension SequenceType where Generator.Element: Addable {
    var sum : Generator.Element {
        return reduce(Generator.Element(), combine: +)
    }
}

extension Array : Loggable {
    
}