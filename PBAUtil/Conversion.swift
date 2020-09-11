//
//  Conversion.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/9/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

class Conversion {
    
    static func toFahrenheit<Num: BinaryInteger>(_ celcius: Num) -> Num {
        return celcius / 5 * 9 + 32
    }
    
    static func toFahrenheit<Num: BinaryFloatingPoint>(_ celcius: Num) -> Num {
        return (celcius / 5) * 9 + 32
    }
    
    static func toCelcius<Num: BinaryInteger>(_ fahrenheit: Num) -> Num {
        return (fahrenheit - 32) * 5 / 9
    }
    
    static func toCelcius<Num: BinaryFloatingPoint>(_ fahrenheit: Num) -> Num {
        return (fahrenheit - 32) * 5 / 9
    }
    
    static func toMeters<Num: BinaryInteger>(_ feet: Num) -> Num {
        return Num(0.3048 * Double(feet))
    }
    
    static func toMeters<Num: BinaryFloatingPoint>(_ feet: Num) -> Num {
        return 0.3048 * feet
    }
    
    static func toFeet<Num: BinaryInteger>(_ meters: Num) -> Num {
        return Num(Double(meters)/0.3048)
    }
    
    static func toFeet<Num: BinaryFloatingPoint>(_ meters: Num) -> Num {
        return meters / 0.3048
    }
}
