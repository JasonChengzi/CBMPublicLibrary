//
//  UITextFieldExtension-Shake.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 7/27/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

// MARK: - Define

/** @enum ShakeDirection
 *
 * Enum that specifies the direction of the shake
 */
enum UITextFieldShakeDirection {
    /** Shake left and right */
    case horizontal
    /** Shake up and down */
    case vertical
}

// MARK: - Public

/**
 * @name UITextField+Shake
 * A UITextField category that add the ability to shake the component
 */
extension UITextField {
    /** Shake the UITextField
     *
     * Shake the text field with default values
     */
    func shake() {
        self.shake(10, withDelta: 5, andCompletionHandler: nil)
    }
    
    /** Shake the UITextField
     *
     * Shake the text field a given number of times
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     */
    func shake(times : Int, withDelta delta : CGFloat) {
        self.shake(times, withDelta: delta, andCompletionHandler: nil)
    }
    
    /** Shake the UITextField
     *
     * Shake the text field a given number of times
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     * @param handler A block object to be executed when the shake sequence ends
     */
    func shake(times : Int, withDelta delta : CGFloat, andCompletionHandler handler : (() -> Void)? = nil) {
        self.pShake(currentTimes: 0, andDirection: 1, andTimes: times, withDelta: delta, andSpeed: 0.03, andShakeDirection: .horizontal, andCompletionHandler: handler)
    }
    
    /** Shake the UITextField at a custom speed
     *
     * Shake the text field a given number of times with a given speed
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     * @param interval The duration of one shake
     */
    func shake(times : Int, withDelta delta : CGFloat, andSpeed interval : NSTimeInterval) {
        self.shake(times, withDelta: delta, andSpeed: interval, andCompletionHandler: nil)
    }
    
    /** Shake the UITextField at a custom speed
     *
     * Shake the text field a given number of times with a given speed
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     * @param interval The duration of one shake
     * @param handler A block object to be executed when the shake sequence ends
     */
    func shake(times : Int, withDelta delta : CGFloat, andSpeed interval : NSTimeInterval, andCompletionHandler handler : (() -> Void)?) {
        self.pShake(currentTimes: 0, andDirection: 1, andTimes: times, withDelta: delta, andSpeed: interval, andShakeDirection: .horizontal, andCompletionHandler: handler)
    }
    
    /** Shake the UITextField at a custom speed
     *
     * Shake the text field a given number of times with a given speed
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     * @param interval The duration of one shake
     * @param direction of the shake
     */
    func shake(times : Int, withDelta delta : CGFloat, andSpeed interval : NSTimeInterval, andShakeDirection shakeDirection : UITextFieldShakeDirection = .horizontal) {
        self.shake(times, withDelta: delta, andSpeed: interval, andShakeDirection: shakeDirection, andCompletionHandler: nil)
    }
    
    /** Shake the UITextField at a custom speed
     *
     * Shake the text field a given number of times with a given speed
     *
     * @param times The number of shakes
     * @param delta The width of the shake
     * @param interval The duration of one shake
     * @param direction of the shake
     * @param handler A block object to be executed when the shake sequence ends
     */
    func shake(times : Int, withDelta delta : CGFloat, andSpeed interval : NSTimeInterval, andShakeDirection shakeDirection : UITextFieldShakeDirection, andCompletionHandler handler : (() -> Void)?) {
        self.pShake(currentTimes: 0, andDirection: 1, andTimes: times, withDelta: delta, andSpeed: interval, andShakeDirection: shakeDirection, andCompletionHandler: handler)
    }
    
}

// MARK: - Private
private extension UITextField {
    func pShake(currentTimes current : Int, andDirection direction : Int, andTimes times : Int, withDelta delta : CGFloat, andSpeed interval : NSTimeInterval, andShakeDirection shakeDirection : UITextFieldShakeDirection, andCompletionHandler handler : (() -> Void)?) {
        UIView.animateWithDuration(
            interval,
            animations: {
                self.transform = shakeDirection == .horizontal ? CGAffineTransformMakeTranslation(delta * direction.toCGFloat, 0) : CGAffineTransformMakeTranslation(0, delta * direction.toCGFloat)
            }
        ) { (finished) in
            
            if current >= times {
                UIView.animateWithDuration(
                    interval,
                    animations: {
                        self.transform = CGAffineTransformIdentity
                    },
                    completion: { (finished) in
                        handler?()
                    }
                )
                return
            }
            
            self.pShake(currentTimes: current + 1, andDirection: direction * -1, andTimes: times - 1, withDelta: delta, andSpeed: interval, andShakeDirection: shakeDirection, andCompletionHandler: handler)
        }
    }
}