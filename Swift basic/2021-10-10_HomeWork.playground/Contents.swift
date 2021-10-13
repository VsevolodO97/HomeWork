import UIKit

/*
 1. Дочитать про Swift Strings

 - https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
 - https://developer.apple.com/documentation/swift/string
 - https://swift.org/blog/utf8-string/
 - https://learnappmaking.com/swift-string-how-to/
 - https://www.swiftbysundell.com/basics/strings/
 - https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html

 2. Новая задача с leetcode

 3. Написать функцию, которая на вход принимает строку вида "Сычев, Александр", а возвращает "Александр Сычев". То есть

 <LAST_NAME>, <FIRST_NAME>" в "<FIRST_NAME> <LAST_NAME>"

 4. Написать функцию, которая принимает строку и возвращает ее версию с перевернутым каждым отдельным словом.
 Например, если строка - «My dog is called Rover», то результирующая строка будет «yM god si dellac revoR».
 Подсказка: можно использовать indices строки (https://developer.apple.com/documentation/swift/string/2949967-indices), пока не найдется пробел, а затем изменить то, что было до него.
 */


/*
 1. Предыдущая задача с leetcode
 Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.
 
 Example 1:
 Input: arr = [1,0,2,3,0,4,5,0]
 Output: [1,0,0,2,3,0,0,4]
 Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
 */

//func duplicateZeros(_ arr: inout [Int]) {
//    var flag = false
//    for index in 0...arr.count - 1 {
//        if flag == true {
//            flag = false
//            continue
//        }
//        if arr[index] == 0 {
//            arr.insert(0, at: index)
//            arr.removeLast()
//            flag = true
//        }
//    }
//}
//var arr = [1,0,2,3,0,4,5,0]
//duplicateZeros(&arr)

// Решение со  счётчиком. Добавил увеличение индекса в проходе, когда добавляем ноль, чтобы не обрабатывать его как новый ноль.
func duplicateZeros1(_ arr: inout [Int]) {
    var index = 0
    while index < arr.count {
        if arr[index] == 0 {
            arr.insert(0, at: index)
            arr.removeLast()
            index += 1
        }
        index += 1
    }
}
var arr = [1,0,2,3,0,4,5,0]
duplicateZeros1(&arr)

/*
 2. Новая задача с leetcode
 You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.

 Merge nums1 and nums2 into a single array sorted in non-decreasing order.

 The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
 
 Example 1:
 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
 The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 
 Example 2:
 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
 Explanation: The arrays we are merging are [1] and [].
 The result of the merge is [1].
 
 Example 3:
 Input: nums1 = [0], m = 0, nums2 = [1], n = 1
 Output: [1]
 Explanation: The arrays we are merging are [] and [1].
 The result of the merge is [1].
 Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    nums1.removeSubrange(m...)
    nums1 += nums2
    nums1.sort()
}
var nums1 = [0]
let m = 0
let nums2 = [1]
let n = 1
merge(&nums1, m, nums2, n)

/*
 3. Написать функцию, которая на вход принимает строку вида "Сычев, Александр", а возвращает "Александр Сычев". То есть
 <LAST_NAME>, <FIRST_NAME>" в "<FIRST_NAME> <LAST_NAME>"
 */

func changeNames(fullName: String) -> String {
    let firstSpace = fullName.firstIndex(of: " ") ?? fullName.endIndex
    let firstName = fullName[..<firstSpace]
    let nextLetter = fullName.index(after: firstSpace)
    let secondName = fullName[nextLetter...]
    return secondName + " " + firstName
}
changeNames(fullName: "Сычев Александр")

// Реализация с методом split
func changeTheWords(string: String) -> String {
    let arrayOfWords = string.split(separator: " ")
    return String(arrayOfWords[1]) + " " + String(arrayOfWords[0])
}
changeTheWords(string: "Сычев Александр")

/*
 4. Написать функцию, которая принимает строку и возвращает ее версию с перевернутым каждым отдельным словом.
 Например, если строка - «My dog is called Rover», то результирующая строка будет «yM god si dellac revoR».
 Подсказка: можно использовать indices строки (https://developer.apple.com/documentation/swift/string/2949967-indices), пока не найдется пробел, а затем изменить то, что было до него.
 */

var string = "My dog is called Rover"
string.indices

func reverseWords(string: String) -> String {
    var finalString = ""
    var i = string.startIndex
    var startWord = string.startIndex
    var endWord = string.startIndex
    while i != string.endIndex {
        if string[i] == " " {
            endWord = string.index(before: i )
            finalString += string[startWord...endWord].reversed() + " "
            startWord = string.index(after: i)
        } else if i == string.index(before: string.endIndex) {
            endWord = string.index(before: string.endIndex)
            finalString += string[startWord...endWord].reversed()
        }
        i = string.index(after: i)
    }
    return finalString
}
print(string)
print(reverseWords(string: string))
