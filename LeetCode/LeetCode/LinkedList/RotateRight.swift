//
//  RotateRight.swift
//  LeetCode
//
//  Created by vin on 2021/7/23.
//

/*
 旋转链表

 一个链表的头节点 head ，旋转链表，将链表每个节点向右移动 k 个位置。
 
*/

class RotateRight {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil,head?.next != nil, k > 0 else {
            return head
        }
        // 获取链表长度，尾节点
        var count = 1
        var preHead = head
        while preHead?.next != nil {
            count += 1
            preHead = preHead?.next
        }
        // 移动步长,如果移动位置为长度的倍数，则为原链表
        var step = count - (k % count)
        guard step != 0 else { return head }
        // 首尾相连
        preHead?.next = head
        // 移动step次
        while step > 0 {
            preHead = preHead?.next
            step -= 1
        }
        // 移动后的尾节点的next为新的头节点
        let newHead = preHead?.next
        // 断开闭环
        preHead?.next = nil
        return newHead
    }
}
