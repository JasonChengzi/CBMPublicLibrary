//
//  SwiftExtension.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 7/26/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

extension Bool {
    var opposite : Bool {
        return !self
    }
    
    mutating func toggle() {
        self = !self
    }
}