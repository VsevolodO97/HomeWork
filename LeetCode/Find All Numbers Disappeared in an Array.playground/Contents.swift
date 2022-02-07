import UIKit

/*
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 
 Example 2:
 Input: nums = [1,1]
 Output: [2]
  

 Constraints:
 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n
  

 Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */


/*
 LeetCode solution:
 Algorithm

 Iterate over the input array one element at a time.
 For each element nums[i], mark the element at the corresponding location negative if it's not already marked so i.e.
 nums[nums[i]−1]×−1 .
 Now, loop over numbers from 1⋯N and for each number check if nums[j] is negative. If it is negative, that means we've seen this number somewhere in the array.
 Add all the numbers to the resultant array which don't have their corresponding locations marked as negative in the original array.
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var numsArr = nums
    var missArr: [Int] = []
   
    for i in 0..<numsArr.count {
        let newIndex = abs(numsArr[i]) - 1
        if numsArr[newIndex] > 0 {
            numsArr[newIndex] *= -1
        }
    }
    
    for i in 1...numsArr.count {
        if numsArr[i - 1] > 0 {
            missArr.append(i)
        }
    }
    
    return missArr
   }

var nums = [4,3,2,7,8,2,3,1]
findDisappearedNumbers(nums)
