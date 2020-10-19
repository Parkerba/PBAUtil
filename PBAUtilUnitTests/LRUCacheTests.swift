//
//  LRUCacheTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 10/19/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil
class LRUCacheTests: XCTestCase {
    
    func testLRUCache() {
        let cache = LRUCache<Int, Int>(3)
        
        for key in 0...3 {
            cache.put(key, for: key)
        }
        
        XCTAssertEqual(cache.get(1), 1)
        XCTAssertNil(cache.get(0))
        cache.put(11, for: 11)
        XCTAssertNil(cache.get(2))
    }
}
