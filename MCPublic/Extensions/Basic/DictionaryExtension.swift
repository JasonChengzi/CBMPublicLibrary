//
//  DictionaryExtension.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/20.
//  Copyright © 2016年 Hvit. All rights reserved.
//
import UIKit

extension Dictionary {
    mutating func merge<K, V>(with dictionarys: Dictionary<K, V>...) {
        for dictionary in dictionarys {
            for (key, value) in dictionary {
                self.updateValue(value as! Value, forKey: key as! Key)
            }
        }
    }
}

extension Dictionary : Loggable {
    
}

func + <K, V>(lhs: [K : V], rhs: [K : V]) -> [K : V] {
    var result = [K : V]()
    for (key, value) in lhs {
        result[key] = value
    }
    for (key, value) in rhs {
        result[key] = value
    }
    return result
}
func += <K, V>(inout lhs: [K : V], rhs: [K : V]) {
    for (k, v) in rhs {
        lhs[k] = v
    }
}
