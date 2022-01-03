import UIKit
/*
 You are given an inclusive range [lower, upper] and a sorted unique integer array nums, where all elements are in the inclusive range.

 A number x is considered missing if x is in the range [lower, upper] and x is not in nums.

 Return the smallest sorted list of ranges that cover every missing number exactly. That is, no element of nums is in any of the ranges, and each missing number is in one of the ranges.

 Each range [a,b] in the list should be output as:

 "a->b" if a != b
 "a" if a == b
  

 Example 1:
 Input: nums = [0,1,3,50,75], lower = 0, upper = 99
 Output: ["2","4->49","51->74","76->99"]
 Explanation: The ranges are:
 [2,2] --> "2"
 [4,49] --> "4->49"
 [51,74] --> "51->74"
 [76,99] --> "76->99"
 
 Example 2:
 Input: nums = [], lower = 1, upper = 1
 Output: ["1"]
 Explanation: The only missing range is [1,1], which becomes "1".
 
 Example 3:
 Input: nums = [], lower = -3, upper = -1
 Output: ["-3->-1"]
 Explanation: The only missing range is [-3,-1], which becomes "-3->-1".
 
 Example 4:
 Input: nums = [-1], lower = -1, upper = -1
 Output: []
 Explanation: There are no missing ranges since there are no missing numbers.
 
 Example 5:
 Input: nums = [-1], lower = -2, upper = -1
 Output: ["-2"]
 */

//Array(0...1000000000)
//func findMissingRanges(_ nums: [Int64], _ lower: Int64, _ upper: Int64) -> [String] {
//    var arr = Array(lower...upper)
////    let set = Array(Set(arr).subtracting(Set(nums))).sorted(by: <)
//    for item in nums {
//        let index = arr.firstIndex(of: item)
//        arr.remove(at: index!)
//    }
//
//    var finalArr: [String] = []
//    var tempArr: [String] = []
//
//    for i in 0..<arr.count {
//        tempArr.append(String(arr[i]))
//        if i == (arr.count - 1) || arr[i] + 1 != arr[i + 1] {
//
//            if tempArr.count < 2 {
//            finalArr.append(String(tempArr[0]))
//            tempArr.removeAll()
//            } else {
//                var a: String = ""
//                a.append(String(tempArr[tempArr.startIndex]))
//                a += "->"
//                a.append(String(tempArr[tempArr.endIndex - 1]))
//                finalArr.append(a)
//                tempArr.removeAll()
//            }
//        }
//    }
//    return finalArr
//}

//findMissingRanges([1000000000], 0, 1000000000)


func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
    
    var finalArr: [String] = []
    
    guard  !nums.isEmpty else {
        if upper == lower {
            finalArr.append("\(lower)")
        } else if upper - lower == 1 {
            finalArr.append("\(lower)")
            finalArr.append("\(upper)")
        } else {
            finalArr.append("\(lower)->\(upper)")
        }
        return finalArr
    }
    
    
    for i in 0..<nums.count {
        
        if nums[0] != lower && nums[0] - lower == 1 {
            finalArr.append("\(lower)")
        } else if nums[0] != lower {
            finalArr.append("\(lower)->\(nums[0] - 1)")
        }
        
            guard i != nums.count - 1 else {
                if upper - nums[nums.count - 1] == 1 {
                    finalArr.append("\(upper)")
                } else if lower == upper && lower == nums[0] {
                    return finalArr
                } else if upper == nums[0] {
                    return finalArr
                } else {
                    finalArr.append("\(nums[nums.count - 1] + 1)->\(upper)")
                }
                return finalArr
            }
            
        if nums[i] + 1 == nums[i + 1] {
            continue
        } else if nums[i + 1] - nums[i] == 2 {
            finalArr.append("\(nums[i] + 1)")
        } else {
            finalArr.append("\(nums[i] + 1)->\(nums[i + 1] - 1)")
        
        }
        
    }
    return finalArr
}
findMissingRanges([0, 1], 0, 1)

