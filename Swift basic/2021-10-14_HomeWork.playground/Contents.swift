import UIKit

/*
 Домашнее задание
 1. 1-2 задачи с leetcode
 2. Попрактиковаться с синтаксисом closures

 - сделать самому шаги, как были на занятии / в playground выше
 */

/*
 Задача с leetcode:
 
 Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.

 Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.

 Return k after placing the final result in the first k slots of nums.

 Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.

 Custom Judge:

 The judge will test your solution with the following code:

 int[] nums = [...]; // Input array
 int val = ...; // Value to remove
 int[] expectedNums = [...]; // The expected answer with correct length.
                             // It is sorted with no values equaling val.

 int k = removeElement(nums, val); // Calls your implementation

 assert k == expectedNums.length;
 sort(nums, 0, k); // Sort the first k elements of nums
 for (int i = 0; i < actualLength; i++) {
     assert nums[i] == expectedNums[i];
 }
 
 Example 1:
 Input: nums = [3,2,2,3], val = 3
 Output: 2, nums = [2,2,_,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 2.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 Example 2:
 Input: nums = [0,1,2,2,3,0,4,2], val = 2
 Output: 5, nums = [0,1,4,0,3,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
 Note that the five elements can be returned in any order.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    nums = nums.filter{ $0 != val }
    return nums.count
   }
var nums = [3, 2, 2, 3]
let val = 3
removeElement(&nums, val)
print(nums)

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
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    nums = Array(Set(nums)).sorted()
    return nums.count
}

var nums1 = [1,1,2]
removeDuplicates(&nums1)
print(nums1)

//{ (parameters) -> return type in
//    statements
//}
var names = ["Иван", "Семен", "Андрей"]

var reversedName = names.sorted(by: { (name1: String, name2: String) -> Bool in
    return name1 < name2
})

// Inferring Type From Context
reversedName = names.sorted(by: { name1, name2 in return name1 < name2 } )

// Implicit Returns
reversedName = names.sorted(by: { name1, name2 in name1 < name2 } )

// Shorthand Argument Names
reversedName = names.sorted(by: { $0 < $1 } )

// Operator Methods
reversedName = names.sorted(by: <)

var images = [6, 22, 8, 14, 16, 0, 7, 9]
var removedIndexes = [2,5,0,6]
var images1 = images
    .enumerated()
    .filter { !removedIndexes.contains($0.offset) }
    .map { $0.element }
print (images1) // [22, 14, 16, 9]

// Совсем не понял синтаксис
let arrayIntCount = [1,1,2,2,6,6,7,2,9,7].reduce(into: [:]) {
          counts, letter in  counts[letter, default: 0] += 1  }
// [6: 2, 9: 1, 1: 2, 2: 3, 7: 2]
print(arrayIntCount)
