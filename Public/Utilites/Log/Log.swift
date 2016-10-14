//
//  Log.swift
//  JRiOSAppFramework
//
//  Created by Jason Raylegih on 28/9/15.
//  Copyright (c) 2015 Jason Raylegih. All rights reserved.
//

let DEBUG_SEPERATOR = "\t===============\t"

func debugLog(message : String) {
    #if DEBUG
        print("\(DEBUG_SEPERATOR)\(Date().standardDateString)(\(Date().timeStamp))\(DEBUG_SEPERATOR)\n\(message ?? "nil message.")\n")
    #endif
}
func debugLog<T>(value : T) {
    #if DEBUG
        print("\(DEBUG_SEPERATOR)\(Date().standardDateString)(\(Date().timeStamp))\(DEBUG_SEPERATOR)\n\(value)\n")
    #endif
}
func debugCompleteLog(message : String, file: String?, line: Int?, column: Int?, function: String?) {
    #if DEBUG
        print("\(DEBUG_SEPERATOR)\(Date().standardDateString)(\(Date().timeStamp))\(DEBUG_SEPERATOR)\nIn file:\n\(file ?? #file).\nAt line \(line ?? #line) and column \(column ?? #column).\n[func \(function ?? #function)]\n\(message)\n")
    #endif
}
func debugCompleteLog<T>(value : T, file: String?, line: Int?, column: Int?, function: String?) {
    #if DEBUG
        print("\(DEBUG_SEPERATOR)\(Date().standardDateString)(\(Date().timeStamp))\(DEBUG_SEPERATOR)\nIn file:\n\(file ?? #file).\nAt line \(line ?? #line) and column \(column ?? #column).\nRunning on: [func \(function ?? #function)]\n\(value)\n")
    #endif
}

struct Log {
    static func debug(message : String) {
        #if DEBUG
            debugLog(message)
        #endif
    }
}
