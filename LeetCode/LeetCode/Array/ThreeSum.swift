//
//  ThreeSum.swift
//  LeetCode
//
//  Created by ABC on 24/07/2021.
//

/*
三数之和

一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组
*/

class ThreeSum {

    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let sortNums = nums.sorted()
        var result = [[Int]]()
        for (i,item) in sortNums.enumerated() {
            if item > 0 {
                break
            }
            if i > 0, item == sortNums[i - 1] {
                continue
            }
            var left = i + 1;
            var right = sortNums.count - 1
            while left < right {
                let sum = item + sortNums[left] + sortNums[right]
                if sum == 0 {
                    result.append([item,sortNums[left],sortNums[right]])
                    while left < right,sortNums[left] == sortNums[left + 1] {
                        left += 1
                    }
                    while left < right,sortNums[right] == sortNums[right-1] {
                        right -= 1
                    }
                }else if(sum > 0){
                    right -= 1
                }else {
                    left += 1
                }
            }
        }
        return result
    }
}
