import UIKit

/*
 Max Consecutive Ones II

Solution
Given a binary array nums, return the maximum number of consecutive 1's in the array if you can flip at most one 0.



Example 1:
Input: nums = [1,0,1,1,0]
Output: 4
Explanation: Flip the first zero will get the maximum number of consecutive 1s. After flipping, the maximum number of consecutive 1s is 4.
 
Example 2:
Input: nums = [1,0,1,1,0,1]
Output: 4


Constraints:
1 <= nums.length <= 105
nums[i] is either 0 or 1.


Follow up: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?
 */

/*
 public int findMaxConsecutiveOnes(int[] nums) {
        int longestSequence = 0;
        int left = 0;
        int right = 0;
        int numZeroes = 0;

        // while our window is in bounds
        while (right < nums.length) {

            // add the right most element into our window
            if (nums[right] == 0) {
                numZeroes++;
            }

            // if our window is invalid, contract our window
            while (numZeroes == 2) {
                if (nums[left] == 0) {
                    numZeroes--;
                }
                left++;
            }

            // update our longest sequence answer
            longestSequence = Math.max(longestSequence, right - left + 1);

            // expand our window
            right++;
        }
        return longestSequence;
    }
 */

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var longestSequence = Int()
    var leftIndex: Int = 0
    var rightIndex: Int = 0
    var numsZeros: Int = 0
 
    while rightIndex < nums.count {
        if nums[rightIndex] == 0 {
            numsZeros += 1
        }
        
        while numsZeros == 2 {
            if nums[leftIndex] == 0 {
                numsZeros -= 1
            }
            leftIndex += 1
        }
        longestSequence = max(longestSequence, rightIndex - leftIndex + 1)
        rightIndex += 1
    }
    return longestSequence
}

var nums = [1,0,1,1,0]

findMaxConsecutiveOnes(nums)
