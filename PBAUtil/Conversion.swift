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
    
    static func toFahrenheit<Num: FloatingPoint>(_ celcius: Num) -> Num {
        return (celcius / Num(5)) * Num(9) + Num(32)
    }
}
