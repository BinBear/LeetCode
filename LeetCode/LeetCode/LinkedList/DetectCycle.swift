//
//  DetectCycle.swift
//  LeetCode
//
//  Created by ABC on 28/07/2021.
//

/*
 环形链表

 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。

 说明：不允许修改给定的链表
 
*/

class DetectCycle {
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil, head?.next != nil else {
            return nil
        }
        var slow = head
        var fast = head
        while slow != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                slow = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return slow
            }
        }
        return nil
    }
}
