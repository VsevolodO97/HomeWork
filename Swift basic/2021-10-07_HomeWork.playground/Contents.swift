import UIKit
import Foundation


/*
 Домашнее задание

 1. Следующая задача с leetcode

 2. Разобраться с Swift Strings

 - https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html
 - https://developer.apple.com/documentation/swift/string
 - https://swift.org/blog/utf8-string/
 - https://learnappmaking.com/swift-string-how-to/
 - https://www.swiftbysundell.com/basics/strings/
 - https://www.mikeash.com/pyblog/friday-qa-2015-11-06-why-is-swifts-string-api-so-hard.html

 3. Написать функцию, которая принимает строку и выводит количество каждого символа в строке. Выходной список отсортировать по числу вхождений символов
 * опционально: вывести число вхождений каждого символв в виде гистограммы, используя символ #

 4. Написать функцию, которая сообщает сколько слов в строке. Замечание: использовать методы split для строки нельзя
 */

/*
 1. Следующая задача с leetcode
 Given a fixed-length integer array arr, duplicate each occurrence of zero, shifting the remaining elements to the right.
 
 Example 1:
 Input: arr = [1,0,2,3,0,4,5,0]
 Output: [1,0,0,2,3,0,0,4]
 Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
 */

func duplicateZeros(_ arr: inout [Int]) {
    var flag = false
    for index in 0...arr.count - 1 {
        if flag == true {
            flag = false
            continue
        }
        if arr[index] == 0 {
            arr.insert(0, at: index)
            arr.removeLast()
            flag = true
        }
    }
}
var arr = [1,0,2,3,0,4,5,0]
duplicateZeros(&arr)

let flag = "🇵🇷"
let firstCodeUnit = flag.startIndex
let secondCodeUnit = flag.utf8.index(after: firstCodeUnit)

if let exactIndex = secondCodeUnit.samePosition(in: flag) {
    print(flag[exactIndex])
} else {
    print("No exact match for this position.")
}
print(firstCodeUnit)

/*
 3. Написать функцию, которая принимает строку и выводит количество каждого символа в строке. Выходной список отсортировать по числу вхождений символов
 * опционально: вывести число вхождений каждого символв в виде гистограммы, используя символ #
 */

let string = "Hello, world!"
// Решение, которое подсмотрел в документации
func countLetters(string: String) -> [Character: Int] {
    string.reduce(into: [:]) { counts, letter in
        counts[letter, default: 0] += 1
    }
}

// Такой вывод элементов словаря в консоль тоже подсмотрел
var dict = countLetters(string: string)
(Array(dict).sorted { $0.1 > $1.1 }).forEach { (k, v) in print("\(k):\(v)") }

// Решение, которое придумал сам, без использования фуекций высшего порядка. Очень дорогое получилось.
func countChar(string: String) -> [Character: Int] {
    var arrayOfChar: [Character] = []
    for char in string {
        arrayOfChar.append(char)
    }
    let originArrayOrChar = Array(Set(arrayOfChar))
    var dictOfArray: [Character: Int] = [:]
    for i in 0...originArrayOrChar.count - 1{
        var count = 0
        for j in 0...arrayOfChar.count - 1 {
            if originArrayOrChar[i] == arrayOfChar[j] {
                count += 1
                dictOfArray.updateValue(count, forKey: originArrayOrChar[i])
            }
        }
    }
    return dictOfArray
}
// Вывод результата в консоль ввиде гистограммы сделал на основе подсмотренного решения
Array(countChar(string: string).sorted { $0.1 > $1.1 }).forEach { (k, v) in print("\(k):\(String(repeatElement("#", count: v)))") }

/*
 4. Написать функцию, которая сообщает сколько слов в строке. Замечание: использовать методы split для строки нельзя
 */
func countWords(string: String) -> Int {
    let arr = Array(string)
    // Посчитаем количество пробелов в предложении
    let count = arr.reduce(0, { x, element in
        if element == " "{
            return x + 1
        }
        return x
    })
    print("The sentence consists of \(count + 1) words")
    return count + 1    // Количество слов в предложении всегда на одно больше, чем пробелов
}

countWords(string: string)
