//
//  MergeTwoSortedList.swift
//  LeetCode
//
//  Created by vin on 2021/7/19.
//

/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class MergeTwoSortedList {

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        
        var prel: ListNode?
        let prehead = ListNode(-1)
        prel = prehead
        
        while l1 != nil && l2 != nil {
            if (l1?.val)! <= (l2?.val)! {
                prel?.next = l1
                l1 = l1?.next
            }else {
                prel?.next = l2
                l2 = l2?.next
            }
        }
        
        prel?.next = l1 ?? l2
        
        return prehead.next
    }
}
