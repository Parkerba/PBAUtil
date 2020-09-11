//
//  MathTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 9/9/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class MathTests: XCTestCase {
    
    func testExponentOperator() {
        XCTAssertEqual(8, 2 ^^ 3)
        XCTAssertEqual(4, 2 ^^ 2)
        XCTAssertEqual(2, 2 ^^ 1)
        XCTAssertEqual(1, 2 ^^ 0)
        XCTAssertEqual(1/2, 2 ^^ -1)
        XCTAssertEqual(0.015625,  4 ^^ -3)
    }
}
