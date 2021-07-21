//
//  LongestPalindrome.swift
//  LeetCode
//
//  Created by vin on 2021/7/21.
//


class LongestPalindrome {

    func longestPalindrome(_ s: String) -> String {
        
        if s.count <= 1 {
            return s
        }
        
        var start = 0
        var end = 0
        var index = 0
        let strArray = Array(s)
        let length = s.count
        var strMap = [String: Int]()
        
        for elment in strArray {
            start = index
            end = index
            // 左侧相同字符跳过
            while start - 1 >= 0, strArray[start-1] == elment {
                start -= 1
            }
            // 右侧相同字符跳过
            while end + 1 < length, strArray[end+1] == elment {
                end += 1
            }
            // 寻找子串
            while start >= 0, end < length {
                
                // 保存当前的最长回文子串
                if strMap["length"] ?? 0 < (end - start + 1), strArray[start] == strArray[end] {
                    strMap["length"] = end - start + 1
                    strMap["start"] = start
                    strMap["end"] = end
                }
                // 左右字符不相等时跳出循环
                if strArray[start] != strArray[end] {
                    break
                }
                // 各向左右移动一位
                start -= 1
                end += 1
            }
            // 进行下一次循环，直至遍历完整个字符串
            index += 1
        }
        
        start = strMap["start"] ?? 0
        end = strMap["end"] ?? 0
        
        var palindrome = [String]()
        
        for index in start...end {
            palindrome.append(strArray[index].description)
        }
        // 去除空格
        return palindrome.joined()
    }
}
