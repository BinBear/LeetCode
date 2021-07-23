//
//  LongestCommonPrefix.swift
//  LeetCode
//
//  Created by vin on 2021/7/23.
//

/*
 
 最长公共前缀:
 查找字符串数组中的最长公共前缀
 如果不存在公共前缀，返回空字符串 ""
 
 */


class LongestCommonPrefix {
    
    
    /* 分治法 */
    
    // 获取两个字符串的公共前缀
    func findTwoStrCommonPrefix(_ string1: String?, _ string2: String?) -> String {
        guard let str1 = string1,let str2 = string2 else { return "" }
        let count = min(str1.count, str2.count)
        var prefix = ""
        for i in 0..<count {
            let index = str1.index(str1.startIndex, offsetBy: i+1)
            if String(str1.prefix(upTo: index)) != String(str2.prefix(upTo: index)) {
                break
            }
            prefix = String(str1.prefix(upTo: index))
        }
        return prefix
    }
    
    // 分治获取数组字符串中的前缀
    func divideCommonPrefix(_ lists: [String], _ left: Int, _ right: Int) -> String {
        if left > right { return "" }
        if left == right { return lists[left] }
        let mid = (left + right) >> 1
        return findTwoStrCommonPrefix(divideCommonPrefix(lists, left, mid), divideCommonPrefix(lists, mid + 1, right))
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        return divideCommonPrefix(strs, 0, strs.count - 1)
    }
    
    /* 迭代法 */
    
    func longestCommonPrefix1(_ strs: [String]) -> String {
        guard var prefix = strs.first else { return "" }
        for i in 1..<strs.count {
            while !strs[i].hasPrefix(prefix) {
                prefix.removeLast()
                if prefix.isEmpty { return "" }
            }
        }
        return prefix
    }
}
