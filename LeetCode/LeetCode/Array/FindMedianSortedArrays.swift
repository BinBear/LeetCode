//
//  FindMedianSortedArrays.swift
//  LeetCode
//
//  Created by vin on 2021/7/20.
//

/*
 寻找两个正序数组的中位数
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。找出并返回这两个正序数组的 中位数 。
 */

class FindMedianSortedArrays {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let newArr = (nums1 + nums2).sorted()
        if newArr.isEmpty { fatalError() }
        var median = 0.0
        let medianIndex = Int(newArr.count / 2)
        if newArr.count % 2 == 0  {
            median = Double(newArr[medianIndex] + newArr[medianIndex - 1])  / 2
        }else {
            median = Double(newArr[medianIndex])
        }
        return median
    }
}
