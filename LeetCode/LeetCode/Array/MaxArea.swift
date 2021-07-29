//
//  MaxArea.swift
//  LeetCode
//
//  Created by ABC on 30/07/2021.
//

/*
盛最多水的容器

n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水

*/
class MaxArea {

    func maxArea(_ height: [Int]) -> Int {
        if height.count <= 1  {
            return 0
        }
        if height.count == 2 {
            return min(height[1], height[0])
        }
        var left = 0
        var right = height.count - 1
        var result = 0
        while left < right {
            let area = min(height[left], height[right]) * (right - left)
            result = max(result, area)
            if height[left] < height[right] {
                left += 1
            }else {
                right -= 1
            }
        }
        return result
    }
}
