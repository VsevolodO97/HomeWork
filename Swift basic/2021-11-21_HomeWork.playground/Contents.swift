import UIKit
import Foundation


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

// Hashable, Sequence (IteratorProtocol), Collection, ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral, CustomStringConvertible

// Set("A", "B", "C") -> Bag("A"|2, "B"|1, "C"|5)
struct Bag<Element: Hashable> {
    private var contents: [Element: UInt] = [:]
    
    init() {
        
    }
    
//    init<S: Sequence>(_ sequens: S) where
//    S.Iterator.Element == Self.Key {
//        for element in sequence {
//            add(element)
//        }
//    }
    
    init<S: Sequence>(_ sequence: S) where
    S.Iterator.Element == (key: Element, value: UInt) {
        for (element, numberOfElements) in sequence {
            add(element, count: numberOfElements)
        }
    }
    
    var uniqueCount: Int {
        contents.count
    }
    
    var totalCount: UInt {
        contents.values.reduce(0){ $0 + $1 }
    }
    
    mutating func add(_ member: Element, count: UInt = 1) {
        if let currentCount = contents[member] {
            contents[member] = currentCount + count
        } else {
            contents[member] = count
        }
    }
    
    mutating func remove(_ member: Element, count: UInt = 1) {
        guard
            let currentCount = contents[member],
            currentCount >= count else {
                return
            }
        
        if currentCount > count {
            contents[member] = currentCount - count
        } else {
            contents.removeValue(forKey: member)
        }
    }
}

var shoppingCart = Bag<String>()
shoppingCart.add("Apple", count: 10)
shoppingCart.add("Banana")
shoppingCart.add("Milk")

extension Bag: CustomStringConvertible {
    var description: String {
        String(describing: contents)
    }
}

print(shoppingCart)

//extension Bag: ExpressibleByArrayLiteral {
//    typealias ArrayLiteralElement = Element
//
//    init(arrayLiteral elements: Self.ArrayLiteralElement...) {
//        self.init(elements.map { $0.hashValue } )
//    }
//}

extension Bag: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.add(element)
        }
    }
}

extension Bag: ExpressibleByDictionaryLiteral {
    typealias Key = Element
    typealias Value = UInt
    
    init(dictionaryLiteral elements: (Self.Key, Self.Value)...) {
        self.init(elements.map { (key: $0.0, value: $0.1) })
    }
}

let shoppingCart2: Bag = ["Banana" : 2, "Orange" : 1]
print(shoppingCart2)

let shoppingCart3: Bag = ["Banana", "Orange", "Apple"]
print(shoppingCart3)

extension Bag: Sequence {
    typealias Iterator = DictionaryIterator<Element, UInt>
    
    func makeIterator() -> DictionaryIterator<Element, UInt> {
        contents.makeIterator()
    }
}

for (element, numberOfElements) in shoppingCart {
    print("\(element) - \(numberOfElements)")
}

for item in shoppingCart2 {
    print(item)
}

let moreThanOne = shoppingCart.filter { $0.1 > 1 }
print(moreThanOne)

// map
// reduce
// sorted
let mappedCart = shoppingCart3.map { $0.key }
let filtredCart = shoppingCart3.filter { $0.key == "Banana"}
let sortedCart = shoppingCart3.sorted { $0.key > $1.key }
let reducedCart = shoppingCart3.reduce(0) { partialResult, value in
    partialResult + value[keyPath: \.value]
}
print(mappedCart)
print(filtredCart)
print(sortedCart)
print(reducedCart)

/*
 4. Реализовать новую коллекцию NonEmptyArray

 - коллекция напоминает стандартный Array, но гарантирует, что всегда содержит хотя бы один элемент
 - должна поддерживать протокол Sequence
 - должна быть поддержана инициализация через стандартный Array
 - нужны публичные свойства / методы: число элементов, добавление, удаление по значению, доступ по индексу (через subscript)
 */
struct NonEmptyArray<Element: Hashable> {
    var content: [Element] = []
    
    var numberOfElements: Int {
        var count = 0
        for _ in content {
            count += 1
        }
        return count
    }
    
//    init<S: Sequence>(_ sequence: S) where
//    S.Iterator.Element == Element {
//        for element in sequence {
//            add(element)
//        }
//    }
    
    mutating func add(_ value: Element) {
        content.append(value)
  
    }
    
    mutating func deleteElement(_ element: Element) {
        for i in 0..<content.count {
            if content[i] == element {
                content.remove(at: i)
            }
        }
    }
}

//struct NonEmptyArrayIterator: IteratorProtocol {
//    typealias Element = NonEmptyArrayIterator
//
//    let element: Element
//
//    init(_ element: Element) {
//        self.element = element
//    }
//    el
//    mutating func next() -> Element? {
//        var nextElementIndex = 0
//        defer { nextElementIndex += 1 }
//        guard nextElementIndex > 0 else {
//            return nil
//        }
//        return nextElementIndex
//    }
//}

//extension NonEmptyArray: IteratorProtocol, Sequence {
//    mutating func next() -> Element? {
//        var nextElement = content[content.startIndex]
//        defer { nextElement = content[content.startIndex + 1] }
//        guard content.count > 0 else {
//            return nil
//        }
//        return nextElement
//    }
//}

extension NonEmptyArray: Sequence {
    typealias Iterator = IndexingIterator<Array<Element>>
    
    func makeIterator() -> IndexingIterator<Array<Element>>{
        content.makeIterator()
    }
}

extension NonEmptyArray: ExpressibleByArrayLiteral{
    init(arrayLiteral: Element...) {
//            self.init()
            for element in arrayLiteral {
                self.add(element)
            }
        }
}

extension NonEmptyArray {
    subscript(index: Int) -> Element {
            get {
                return content[index]
            }
            set(newValue) {
                content[index] = newValue
            }
    }
}

var somef: NonEmptyArray = ["SDF"]
somef.add("fgdfg")
print(somef)

for i in somef {
    print(i)
}

somef.numberOfElements
somef.deleteElement("fgdfg")
somef[0]
somef[0] = "Hello World"
print(somef)
