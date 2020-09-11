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
    
    func testToCelcius() {
        XCTAssertEqual(0, Conversion.toCelcius(32))
        XCTAssertEqual(100, Conversion.toCelcius(212))
        
        XCTAssertEqual(0.0, Conversion.toCelcius(32.0))
        XCTAssertEqual(100.0, Conversion.toCelcius(212.0))
    }
    
    func testToMeters() {
        XCTAssertEqual(0.6096, Conversion.toMeters(2))
        XCTAssertEqual(8, Conversion.toMeters(27))
    }
    
    func testToFeet() {
        XCTAssertEqual(2, Conversion.toFeet(0.6096))
        XCTAssertTrue((19.684...19.686).contains(Conversion.toFeet(6)))
        XCTAssertEqual(19, Conversion.toFeet(6))
    }
    
    
}
