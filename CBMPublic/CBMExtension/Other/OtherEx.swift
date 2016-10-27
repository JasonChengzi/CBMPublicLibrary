import Foundation

func perform(after delay : TimeInterval, operation : @escaping CBMClosure.empty) -> CBMClosure.cancelable? {
    func performAfter(toPerform : @escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: toPerform)
    }
    
    var closure : CBMClosure.empty? = operation
    var cancelableClosure : CBMClosure.cancelable?
    
    let delayedClosure : CBMClosure.cancelable = {
        cancel in
        if closure != nil {
        if cancel == false {
            DispatchQueue.main.async {
                closure?()
            }
        }
        }
        closure = nil
        cancelableClosure = nil
    }
    cancelableClosure = delayedClosure
    
    performAfter {
        if let delayedClosure = cancelableClosure {
            delayedClosure(false)
        }
    }
    return cancelableClosure
}

func cancel(delayedClosure : CBMClosure.cancelable?) {
    if delayedClosure != nil { delayedClosure!(true) }
}
