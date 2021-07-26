//
//  ThreeSumClosest.swift
//  LeetCode
//
//  Created by ABC on 26/07/2021.
//

/*
最接近的三数之和

一个包括n个整数的数组 nums 和一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案
*/

class ThreeSumClosest {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else {
            return -1
        }
        let sortNums = nums.sorted()
        var result = sortNums[0] + sortNums[1] + sortNums[2]
        for (i, item) in sortNums.enumerated() {
            if i > 0, item == sortNums[i - 1] {
                continue
            }
            var left = i + 1;
            var right = sortNums.count - 1
            while left < right {
                let sum = item + sortNums[left] + sortNums[right]
                if abs(sum - target) < abs(result - target) {
                    result = sum
                }else if sum > target {
                    right -= 1
                }else if sum < target {
                    left += 1
                }else {
                    return result
                }
            }
        }
        return result
    }
}
