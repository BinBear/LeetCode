//
//  TwoSum.swift
//  LeetCode
//
//  Created by vin on 2021/7/19.
//

/*
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那两个整数，并返回它们的数组下标。

 假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。
 按任意顺序返回答案。
 */


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numMap = [Int: Int]()
    for (index, value) in nums.enumerated() {
        let match = target - value
        if numMap.keys.contains(match) && numMap[match] != index {
            return [numMap[match]!, index]
        }
        numMap[value] = index
    }
    fatalError("No valid outputs")
}

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var numMap = [Int: Int]()
    for (index, value) in nums.enumerated() {
        if let matchIndex = numMap[target - value] {
            return [matchIndex, index]
        }
        numMap[value] = index
    }
    fatalError("No valid outputs")
}
