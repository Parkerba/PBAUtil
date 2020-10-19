//
//  +ArrayTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 10/2/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class ArrayTests: XCTestCase {
    
    func testIsPalindromic() {
        let evenPalindrome = [Character]("hannah")
        XCTAssertTrue(evenPalindrome.isPalindromic())
        
        let oddPalindrome = [Character]("racecar")
        XCTAssertTrue(oddPalindrome.isPalindromic())
        
        let smallPalindrome = [Character]("f")
        XCTAssertTrue(smallPalindrome.isPalindromic())
        
        let smallPalindrome1 = [Character]("ff")
        XCTAssertTrue(smallPalindrome1.isPalindromic())
        
        let empty = [Character]("")
        XCTAssertTrue(empty.isPalindromic())
        
        let nonPalindrome = [0,1]
        XCTAssertFalse(nonPalindrome.isPalindromic())
        
        let nonPalindrome1 = [0,1,1,1,0,1]
        XCTAssertFalse(nonPalindrome1.isPalindromic())
        
        let nonPalindrome2 = [Character]("Not a palindrome")
        XCTAssertFalse(nonPalindrome2.isPalindromic())
    }
    
}

