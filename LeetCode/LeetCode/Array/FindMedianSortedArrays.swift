//
//  FindMedianSortedArrays.swift
//  LeetCode
//
//  Created by vin on 2021/7/20.
//

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
