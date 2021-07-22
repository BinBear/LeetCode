//
//  MergeKSortedList.swift
//  LeetCode
//
//  Created by ABC on 23/07/2021.
//

/*
一个链表数组，每个链表都已经按升序排列。

将所有链表合并到一个升序链表中，返回合并后的链表
 
*/

class MergeKSortedList {
    
    func divideMerge(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left > right { return nil }
        if left == right { return lists[left] }
        let mid = (left + right) >> 1
        let twoMerge = MergeTwoSortedList()
        return twoMerge.mergeTwoLists2(divideMerge(lists, left, mid), divideMerge(lists, mid+1, right))
    }

    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count < 1 {
            return nil
        }
        if lists.count == 1 {
            return lists[0]
        }
        return divideMerge(lists, 0, lists.count - 1)
    }
}
