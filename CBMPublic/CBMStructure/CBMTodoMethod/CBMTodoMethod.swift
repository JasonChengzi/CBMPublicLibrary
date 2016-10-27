import Foundation

struct CBMTodoMethod {
    static func toBeDone(message: String? = nil, file: String? = #file, line: Int? = #line, column: Int? = #column, function: String? = #function) {
        CBMDebugLog.printComplete("未完成的方法调用。【\(message)】", file: file, line: line, column: column, function: function)
    }
    static func toBeHandledException(message: String? = nil, file: String? = #file, line: Int? = #line, column: Int? = #column, function: String? = #function) {
        CBMDebugLog.printComplete("未处理的异常抛出。【\(message)】", file: file, line: line, column: column, function: function)
    }
}
