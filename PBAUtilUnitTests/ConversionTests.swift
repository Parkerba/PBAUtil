//
//  ConversionTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 9/9/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil
class ConversionTests: XCTestCase {
    
    func testToFahrenheit() {
        XCTAssertEqual(32, Conversion.toFahrenheit(0))
        XCTAssertEqual(212, Conversion.toFahrenheit(100))
        
        XCTAssertEqual(32.0, Conversion.toFahrenheit(0.0))
        XCTAssertEqual(212, Conversion.toFahrenheit(100.0))
    }
    
}
