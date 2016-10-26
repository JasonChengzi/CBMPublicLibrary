//
//  CAKeyframeAnimationExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 16/06/21.
//  Copyright © 2016年 Hvit. All rights reserved.
//

extension CAKeyframeAnimation {
    func makeDuration(duration : CFTimeInterval) -> CAKeyframeAnimation {
        self.duration = duration
        return self
    }
    func makeRepeatCount(count : Float) -> CAKeyframeAnimation {
        self.repeatCount = count
        return self
    }
    func makeKeyTimes(times : [NSNumber]?) -> CAKeyframeAnimation {
        self.keyTimes = times
        return self
    }
    func makeValues(values : [AnyObject]?) -> CAKeyframeAnimation {
        self.values = values
        return self
    }
    func makeTimingFunctions(functions : [CAMediaTimingFunction]?) -> CAKeyframeAnimation {
        self.timingFunctions = functions
        return self
    }
    func makeTimingFunction(function : CAMediaTimingFunction?) -> CAKeyframeAnimation {
        self.timingFunction = function
        return self
    }
}
