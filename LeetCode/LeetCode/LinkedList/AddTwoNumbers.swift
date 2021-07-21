//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by vin on 2021/7/21.
//

/*
 两数相加
 
 两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 将两个数相加，并以相同形式返回一个表示和的链表。

 假设除了数字 0 之外，这两个数都不会以 0 开头。

 */

class AddTwoNumbers {

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        // 当两个链表都为空时，退出递归
        if l1 == nil, l2 == nil { return nil }
        // 先保存下一个节点
        var nextNode: ListNode? = l1?.next
        // 当前节点两个链表对应值相加
        var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        if sum > 9 {
            // 将进1的值保存到下一个节点
            nextNode = ListNode((l1?.next?.val ?? 0) + (sum/10), l1?.next?.next)
            sum = sum % 10
        }
        
        return ListNode(sum, addTwoNumbers(nextNode, l2?.next))
    }
    
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var list1 = l1
        var list2 = l2

        // 进位值
        var carry = 0
        // 返回的结果链
        let result: ListNode? = ListNode()
        // 当前节点
        var currentNode: ListNode? = result
        
        // 遍历两个链表，直至链表都为空且进位值为0
        while list1 != nil || list2 != nil || carry > 0 {
            // 求和
            let sum = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            // 更新下次遍历的链表
            list1 = list1?.next
            list2 = list2?.next
            // 更新进位值
            carry = sum / 10
            // 保存本次节点
            currentNode?.next = ListNode(sum%10)
            // 更新当前节点
            currentNode = currentNode?.next
        }
        return result?.next
    }
}
