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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
    }
}
