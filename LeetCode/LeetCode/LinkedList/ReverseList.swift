//
//  ReverseList.swift
//  LeetCode
//
//  Created by vin on 2021/7/20.
//

import UIKit

class ReverseList {

    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        
        let newHead = reverseList(head?.next)
        
        head?.next?.next = head
        head?.next = nil
        
        return newHead
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var oldNode = head
        var newNodel: ListNode? = nil
        
        while oldNode != nil {
            let oldNextNodel = oldNode?.next
            oldNode?.next = newNodel
            newNodel = oldNode
            oldNode = oldNextNodel
        }
        return newNodel
    }
}
