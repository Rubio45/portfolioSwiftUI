/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.
 */

import Foundation
/*
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        // diccionario con el numero de indice
        var numIndices: [Int: Int] = [:]
        
        // obtiene el numero de indice y el elemento del array.
        for (i, num) in nums.enumerated() {
            // calcular el complemento
            let complement = target - num
            // si el complemento existe en el diccionario, devolver el indice del complemento y el indice action
            if let complementIndex = numIndices[complement] {
                return [complementIndex, i]
            }
            // si llega a aqui, entonces se añade el indice al diccionario con su key
            numIndices[num] = i
        }
        
        return []
    }
}
*/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 */
/*
public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil;
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}

class Solution {
    static func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1, let l2 else { return nil }

        let value: Int = l1.val + l2.val
        let result = ListNode(value, addTwoNumbers(l1.next, l2.next))
        
        print(value, terminator: ", ")
        return result
    }
}
*/



/*
Given an integer x, return true if x is a
palindrome
, and false otherwise.
 
Example 1:

Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
Example 3:

Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 

Constraints:

-231 <= x <= 231 - 1
 

Follow up: Could you solve it without converting the integer to a string?

 */
/*
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let string = String(x)
        let reversed = String(string.reversed())
        return string == reversed
    }
}
*/

/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.


 */
import Foundation

class Solution {
    
    func romanToInt(_ s: String) -> Int {

        let dictRomanToInt: [Character: Int] = [
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000
        ]

        let capitalString = s.uppercased()
        let arrayString = Array(capitalString)
        
        var number = 0
        var index = 0
        
        while index < arrayString.count {
            let currentChar = arrayString[index]
            if let currentVal = dictRomanToInt[currentChar] {
                
                if index + 1 < arrayString.count, let nextVal = dictRomanToInt[arrayString[index + 1]], nextVal > currentVal {
                    number += (nextVal - currentVal)
                    index += 2
                } else {
                    
                    number += currentVal
                    index += 1
                }
            }
        }
        
        return number
    }
}
