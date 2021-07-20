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

    func mergeTwoLists1(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        
        let dummyNode = ListNode()
        var node: ListNode? = dummyNode
        
        while l1 != nil, l2 != nil {
            if (l1?.val)! <= (l2?.val)! {
                node?.next = l1
                l1 = l1?.next
            }else {
                node?.next = l2
                l2 = l2?.next
            }
            node = node?.next
        }
        
        node?.next = l1 ?? l2
        
        return dummyNode.next
    }
    
    
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        guard let l1 = list1 else { return list2 }
        guard let l2 = list2 else { return list1 }
        
        if l1.val < l2.val {
            l1.next = mergeTwoLists2(l1.next, l2)
            return l1
        }else {
            l2.next = mergeTwoLists2(l1, l2.next)
            return l2
        }
    }
}


