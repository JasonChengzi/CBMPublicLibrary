//
//  EnumerationProtocols.swift
//  ChildrenGuardian
//
//  Created by Jason.Chengzi on 9/7/16.
//  Copyright © 2016 Hvit. All rights reserved.
//

import Foundation

protocol Togglable { mutating func toggle() }

protocol EnumStringValueConvertible {
    var stringValue : String { get }
}
protocol EnumTextValueConvertible: EnumStringValueConvertible {
    var textValue : String { get }
}