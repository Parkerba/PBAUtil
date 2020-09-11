//
//  Math.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/9/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

infix operator ^^ : MultiplicationPrecedence
extension Int {
    
    static func ^^(_ lhs: Int, rhs:Int) -> Double {
        var returnValue: Int64 = 1
        let isNegativeExponent = (rhs < 0)
        let exponent = rhs.magnitude
        for _ in 0..<Int64(exponent) {
            returnValue *= Int64(lhs)
        }
        return isNegativeExponent ? 1/Double(returnValue):Double(returnValue)
    }
    
}

extension Double {
    
    static func ^^(_ lhs: Double, rhs: Int) -> Double {
        var returnValue: Int64 = 1
        let isNegativeExponent = (rhs < 0)
        let exponent = rhs.magnitude
        for _ in 0..<exponent {
            returnValue *= Int64(lhs)
        }
        return isNegativeExponent ? 1/Double(returnValue):Double(returnValue)
    }
    
}
