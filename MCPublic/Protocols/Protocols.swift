//
//  Protocols.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 8/22/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

protocol Loggable : CustomStringConvertible {
    //    init(dictionary : [String : AnyObject])
}

protocol Addable {
    init()
    
    func + (lhs: Self, rhs: Self) -> Self
}

