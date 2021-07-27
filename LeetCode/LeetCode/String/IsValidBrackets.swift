//
//  IsValidBrackets.swift
//  LeetCode
//
//  Created by vin on 2021/7/27.
//

/*
 
 有效的括号:
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 
 */

class IsValidBrackets {
    
    // 不使用Map, 效率较低
    func isValid(_ s: String) -> Bool {
        // 判断是否为偶数
        guard (s.count & 1) == 0 else {
            return false
        }
        var str = s
        while str.contains("()") || str.contains("{}") || str.contains("[]") {
            str = s.replacingOccurrences(of: "()", with: "").replacingOccurrences(of: "{}", with: "").replacingOccurrences(of: "[]", with: "")
        }
        return str == ""
    }
    
    // 使用Map
    func isValid1(_ s: String) -> Bool {
        // 判断是否为偶数
        guard (s.count & 1) == 0 else {
            return false
        }
        let map = [")": "(", "}": "{", "]": "["]
        var stack = [String]()
        
        for char in s {
            // 是否为左括号
            if map.values.contains(char.description) {
                stack.append(char.description)
            }else {
                // 如果左括号与栈顶元素不同则表示无效
                guard !stack.isEmpty, map[char.description] == stack.popLast() else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}
