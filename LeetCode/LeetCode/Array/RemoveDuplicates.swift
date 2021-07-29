//
//  RemoveDuplicates.swift
//  LeetCode
//
//  Created by ABC on 29/07/2021.
//

/*
删除排序数组中的重复项

一个有序数组 nums ，原地删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

不要使用额外的数组空间，必须在原地修改输入数组 并在使用 O(1) 额外空间的条件下完成

*/


class RemoveDuplicates {

    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        var fast = 1
        var slow = 1
        for _ in 1..<nums.count {
            if nums[fast] != nums[fast-1] {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        return slow
    }
}
