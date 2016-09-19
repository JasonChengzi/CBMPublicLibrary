//
//  Log.swift
//  JRiOSAppFramework
//
//  Created by Jason Raylegih on 28/9/15.
//  Copyright (c) 2015 Jason Raylegih. All rights reserved.
//

func debugLog(message : String) {
    #if DEBUG
        print("==========\(Date().standardDateString)(\(Date().timeStamp))==========\n\(message ?? "nil message.")\n")
    #endif
}
func debugLog<T>(value : T) {
    #if DEBUG
        print("==========\(Date().standardDateString)(\(Date().timeStamp))==========\n\(value)\n")
    #endif
}
func debugCompleteLog(message : String) {
    #if DEBUG
        print("==========\(Date().standardDateString)(\(Date().timeStamp))==========\n(In file \(#file) at line \(#line).)\n[func \(#function)]\n\(message)\n")
    #endif
}
func debugCompleteLog<T>(value : T) {
    #if DEBUG
        print("==========\(Date().standardDateString)(\(Date().timeStamp))==========\n(In file \(#file) at line \(#line).)\n[func \(#function)]\n\(value)\n")
    #endif
}

struct Log {
    static func debug(message : String) {
        #if DEBUG
            debugLog(message)
        #endif
    }
}