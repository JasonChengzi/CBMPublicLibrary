//
//  Platform.swift
//  HealthPlus
//
//  Created by Jason.Chengzi on 16/05/19.
//  Copyright © 2016年 Hvit. All rights reserved.
//

struct Platform {
    static let isSimulator : Bool = {
        var simulator = false
        #if arch(i386) || arch(x86_64)
            simulator = true
        #endif
        return simulator
    }()
}