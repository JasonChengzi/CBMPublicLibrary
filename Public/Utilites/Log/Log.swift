//
//  Log.swift
//  JRiOSAppFramework
//
//  Created by Jason Raylegih on 28/9/15.
//  Copyright (c) 2015 Jason Raylegih. All rights reserved.
//

func debugLog(message : String) {
    #if DEBUG
        print("==========\(NSDate().toStandardString)==========\n\(message ?? "nil message.")\n")
    #endif
}
func debugLog<T>(value : T) {
    #if DEBUG
        print("==========\(NSDate().toStandardString)==========\n\(value)\n")
    #endif
}
func debugCompleteLog(message : String) {
    #if DEBUG
        print("==========\(NSDate().toStandardString)==========\n(In file \(#file) at line \(#line).)\n[func \(#function)]\n\(message)\n")
    #endif
}
func debugCompleteLog<T>(value : T) {
    #if DEBUG
        print("==========\(NSDate().toStandardString)==========\n(In file \(#file) at line \(#line).)\n[func \(#function)]\n\(value)\n")
    #endif
}