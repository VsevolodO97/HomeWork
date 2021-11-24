import UIKit


/*
 Домашнее задание

 1. Реализовать текущую задачу с leetcode согласно задания (через бинарный поиск)
 2. +1 задача с leetcode
 3. Доделать реализацию кастомной коллекции Bag: реализовать поддержку инициализации через Array, проверить, как работают функции высшего порядка
 4. Реализовать новую коллекцию NonEmptyArray

 - коллекция напоминает стандартный Array, но гарантирует, что всегда содержит хотя бы один элемент
 - должна поддерживать протокол Sequence
 - должна быть поддержана инициализация через стандартный Array
 - нужны публичные свойства / методы: число элементов, добавление, удаление по значению, доступ по индексу (через subscript)
 */

/*
 1. Реализовать текущую задачу с leetcode согласно задания (через бинарный поиск)
 
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 
 Example 3:
 Input: nums = [1], target = 0
 Output: -1
  
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    if n == 1 {
        return nums[n - 1] == target ? 0 : -1
    }
    
    func findRotateIndex(left: Int, right: Int) -> Int {
        var left = left
        var right = right
        if nums[left] < nums[right] {
            return 0
        }
        while left <= right {
            let pivot = (left + right) / 2
            if nums[pivot] > nums[pivot + 1] {
                return pivot + 1
            } else if nums[pivot] < nums[left] {
                right = pivot - 1
            } else {
                left = pivot + 1
            }
        }
        return 100
    }
    
    func binarySearch(left: Int, right: Int) -> Int {
        let sortedArray = nums
        var startIndex: Int = left
        var endIndex: Int = right
        
        while startIndex <= endIndex {
            let middle: Int = (startIndex + endIndex) / 2
            if sortedArray[middle] == target {
                return middle
            } else if sortedArray[middle] > target {
                endIndex = middle - 1
            } else if sortedArray[middle] < target {
                startIndex = middle + 1
            }
        }
        print("Array has not element: \(target)")
        return -1
    }
    
    
    let rotateIndex = findRotateIndex(left: 0, right: n - 1)
    
    if nums[rotateIndex] == target {
        return rotateIndex
    } else if rotateIndex == 0 {
        return binarySearch(left: 0, right: n - 1)
    } else if target < nums[0] {
        return binarySearch(left: rotateIndex, right: n - 1)
    } else {
        return binarySearch(left: 0, right: rotateIndex)
    }
    
}

search([4,5,6,7,0,1,2], 0)
search([4,5,6,7,0,1,2], 3)
search([1], 0)


/*
 2. +1 задача с leetcode
 
 You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

 Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.

 You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

  

 Example 1:
 Input: n = 5, bad = 4
 Output: 4
 Explanation:
 call isBadVersion(3) -> false
 call isBadVersion(5) -> true
 call isBadVersion(4) -> true
 Then 4 is the first bad version.
 
 Example 2:
 Input: n = 1, bad = 1
 Output: 1
 */

let bad = 4
func isBadVersion(_ guess:Int) -> Bool{ // This is API from Leetcode
    if guess >= bad {
        return true
    }
    return false
}

func firstBadVersion(_ n: Int) -> Int {
    var left = 0
    var right = n
    
    while left <= right {
        let middle = (left + right) / 2
        if isBadVersion(middle) {
            guard isBadVersion(middle - 1) else {
                return middle
            }
            right = middle
        } else {
            guard !isBadVersion(middle + 1) else {
                return middle + 1
            }
            left = middle + 1
        }
    }
    return 999
}

firstBadVersion(5)

//  3. Доделать реализацию кастомной коллекции Bag: реализовать поддержку инициализации через Array, проверить, как работают функции высшего порядка

