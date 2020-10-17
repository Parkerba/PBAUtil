//
//  +Array.swift
//  PBAUtil
//
//  Created by parker amundsen on 10/2/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    ///This function returns true if this equatable array is a palindrome, else false is returned.
    ///Example:
    ///```
    ///let palindrome = [1,2,3,2,1]
    ///print(palindrome.isPalindromic) // Prints true
    ///
    ///let nonPalindrome = [1,2]
    ///print(nonPalindrome.isPalindromic) // Prints false
    ///```
    ///- Time Complexity: O(n)
    func isPalindromic() -> Bool {
        var left = 0, right = self.count - 1
        while left < right {
            if self[left] != self[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }
}
