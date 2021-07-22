//
//  StringAtoi.swift
//  LeetCode
//
//  Created by ABC on 22/07/2021.
//

/*
 字符串转换整数 (atoi)
 
 函数 myAtoi(string s) 的算法如下：

 读入字符串并丢弃无用的前导空格
 检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
 读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
 将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
 如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −231 ，大于 231 − 1 的整数应该被固定为 231 − 1 。
 返回整数作为最终结果。
 */

class StringAtoi {
    func myAtoi(_ s: String) -> Int {
        // 去除收尾空格
        let str = s.trimmingCharacters(in: .whitespaces)
        guard str.count > 0 else { return 0 }
        let strArray = Array(str)
        let firstChar = strArray.first!;
        // 判断首字符合法
        guard (firstChar.isNumber || firstChar == "+" || firstChar == "-") else {
            return 0
        }
        var resultStr = ""
        // 遍历字符串
        for (i, item) in strArray.enumerated() {
            if i == 0 {
                if item.isNumber || item == "+" || item == "-" {
                    resultStr.append(item)
                    continue
                }
            }else {
                if item.isNumber {
                    resultStr.append(item)
                }else {
                    break
                }
            }
        }
        // 判断结果字符串合法
        guard resultStr != "+" else {
            return 0
        }
        guard resultStr != "-" else {
            return 0
        }
        // 判断是否溢出
        let resultInt = Int32(resultStr)
        guard resultInt != nil else {
            return resultStr.contains("-") ? Int(Int32.min) : Int(Int32.max)
        }
        return Int(resultStr)!
    }
}
