import UIKit

/*
 Given an array of integers arr, return true if and only if it is a valid mountain array.

 Recall that arr is a mountain array if and only if:

 arr.length >= 3
 There exists some i with 0 < i < arr.length - 1 such that:
 arr[0] < arr[1] < ... < arr[i - 1] < arr[i]
 arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
 
 
 Example 1:
 Input: arr = [2,1]
 Output: false
 
 Example 2:
 Input: arr = [3,5,5]
 Output: false
 
 Example 3:
 Input: arr = [0,3,2,1]
 Output: true
  

 Constraints:
 1 <= arr.length <= 104
 0 <= arr[i] <= 104
 
 public boolean validMountainArray(int[] A) {
        int N = A.length;
        int i = 0;

        // walk up
        while (i+1 < N && A[i] < A[i+1])
            i++;

        // peak can't be first or last
        if (i == 0 || i == N-1)
            return false;

        // walk down
        while (i+1 < N && A[i] > A[i+1])
            i++;

        return i == N-1;
    }
 */

func validMountainArray(_ arr: [Int]) -> Bool {
    let count = arr.count
    var i = 0
    
    while (i + 1) < count && arr[i] < arr[i + 1] {
        i += 1
    }
    
    if (i == 0) || (i == count - 1) {
        return false
    }
    
    while (i + 1) < count && arr[i] > arr[i + 1] {
        i += 1
    }
    
    return i == count - 1
    }


validMountainArray([0, 2, 3, 3, 5, 2, 1, 0])


/*
 Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.

 After doing so, return the array.

  

 Example 1:
 Input: arr = [17,18,5,4,6,1]
 Output: [18,6,6,6,1,-1]
 Explanation:
 - index 0 --> the greatest element to the right of index 0 is index 1 (18).
 - index 1 --> the greatest element to the right of index 1 is index 4 (6).
 - index 2 --> the greatest element to the right of index 2 is index 4 (6).
 - index 3 --> the greatest element to the right of index 3 is index 4 (6).
 - index 4 --> the greatest element to the right of index 4 is index 5 (1).
 - index 5 --> there are no elements to the right of index 5, so we put -1.
 
 Example 2:
 Input: arr = [400]
 Output: [-1]
 Explanation: There are no elements to the right of index 0.
  

 Constraints:
 1 <= arr.length <= 104
 1 <= arr[i] <= 105
 */

func replaceElements(_ arr: [Int]) -> [Int] {
    var newArr: [Int] = []
    
    for i in 0..<arr.count {
        var maxInt = 0
        for j in (i + 1)..<arr.count {
            
            if arr[j] > maxInt {
                maxInt = arr[j]
            }
        }
        if i == arr.count - 1 {
            maxInt = -1
        }
        newArr.append(maxInt)
    }
    return newArr
    }
replaceElements([400])

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 If all assertions pass, then your solution will be accepted.

  

 Example 1:
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 Example 2:
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
  

 Constraints:
 0 <= nums.length <= 3 * 104
 -100 <= nums[i] <= 100
 nums is sorted in non-decreasing order.
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = Array(Set(nums)).sorted()
         return nums.count
   }

func removeDuplicates1(_ nums: inout [Int]) -> Int {
    for i in 0..<nums.count {
        guard i != nums.count - 1 else {
            return nums.count
        }
        while (i != nums.count - 1) && (nums[i] == nums[i + 1]) {
                nums.remove(at: i)
            guard i != nums.count - 1 else {
                return nums.count
            }
        }
    }
         return nums.count
   }
var nums = [1, 2, 2]
removeDuplicates1(&nums)
