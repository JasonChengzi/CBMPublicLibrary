import Foundation

struct CBMDebugLog {
    
    static let seperator = "\t===============\t"
    static let dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    static func print(_ message : String) {
        #if DEBUG
            print(seperator + Date().toString(with: dateFormat) + "(\(Date().timeStamp))" + seperator + "\n" + (message ?? "Empty message.") + "\n")
        #endif
    }
    
    static func print<T>(_ value : T) {
        #if DEBUG
            print(seperator + Date().toString(with: dateFormat) + "(\(Date().timeStamp))" + seperator + "\n" + value + "\n")
        #endif
    }
    
    static func printComplete(_ message : String, file: String?, line: Int?, column: Int?, function: String?) {
        CBMDebugLog.print("In file:\n\(file ?? #file).\nAt line \(line ?? #line) and column \(column ?? #column).\n[func \(function ?? #function)]\n\(message)")
    }
    static func printComplete<T>(_ value : T, file: String?, line: Int?, column: Int?, function: String?) {
        CBMDebugLog.print("In file:\n\(file ?? #file).\nAt line \(line ?? #line) and column \(column ?? #column).\nRunning on: [func \(function ?? #function)]\n\(value)")
    }
}
