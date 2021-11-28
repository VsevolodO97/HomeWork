import UIKit

/*
 4. Реализовать новую коллекцию NonEmptyArray

 - коллекция напоминает стандартный Array, но гарантирует, что всегда содержит хотя бы один элемент
 - должна поддерживать протокол Sequence
 - должна быть поддержана инициализация через стандартный Array
 - нужны публичные свойства / методы: число элементов, добавление, удаление по значению, доступ по индексу (через subscript)
 + реализовать свои индексы и свой Итератор (можно через AnyIterator)
 */

struct NonEmptyArray<Element: Hashable> {
    private var content: [Element] = []
    
    var numberOfElements: Int {
        var count = 0
        for _ in content {
            count += 1
        }
        return count
    }
    
    init?(content: [Element]) {
        if content.isEmpty { return nil }
        else {
            self.content = content
        }
    }
    
    init?<S: Sequence>(_ sequence: S) where
    S.Iterator.Element == Element {
        var count = 0
        for element in sequence {
            add(element)
            count += 1
        }
        if count == 0 {
            return nil
        }
    }
    
    mutating func add(_ value: Element) {
        content.append(value)
    }
    
    // Добавил assert - ограничение на удаление последнего в коллекции элемента
    
    // !!! Не работет удалени первого элемента
    
    mutating func deleteElement(_ element: Element) {
        for i in 0..<content.count {
            if content[i] == element {
                assert(content.count > 1, "Can't delete last element of NonEmptyArray.")
                content.remove(at: i )
            } 
        }
    }
}

extension NonEmptyArray: Sequence {
    typealias Iterator = AnyIterator<Element>
    
    func makeIterator() -> Iterator {
        var iterator = content.makeIterator()
        
        return AnyIterator {
            iterator.next()
        }
    }
}

extension NonEmptyArray: ExpressibleByArrayLiteral{
    init(arrayLiteral: Element...) {
        self.init(arrayLiteral)!    // !!! Происходит краш при инициализации пустым массивом
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

// Collection

struct NonEmptyArrayIndex<Element: Hashable> {
    var index = Array<Element>.Index()
    
    init(_ arrayIndex: Array<Element>.Index) {
        self.index = arrayIndex
    }

}

extension NonEmptyArrayIndex: Comparable {
    static func < (lhs: NonEmptyArrayIndex, rhs: NonEmptyArrayIndex) -> Bool {
        lhs.index == rhs.index
    }
    
    
}
extension NonEmptyArray: Collection {
    typealias Index = NonEmptyArrayIndex<Element>
    
    func index(after i: Index) -> Index {
        Index(content.index(after: i.index))
    }

    var startIndex: Index {
        NonEmptyArrayIndex(content.startIndex)
    }

    var endIndex: Index {
        NonEmptyArrayIndex(content.endIndex)
    }
    
    subscript(position: Index) -> Iterator.Element {
        let arrElement = content[position.index]
        return arrElement
    }

}

var someArr: NonEmptyArray = ["First member"]
someArr.add("Second member")
print(someArr)

// !!! Крашится удаление первого элемента
//somef.deleteElement("fgdfg")
//somef.deleteElement("SDF")
//somef.remove(at: 0)



// !!! Какая инициализация через какой инициализтор?
var anotherArr = NonEmptyArray(["First member", "Second member"])
var anotherArr1 = NonEmptyArray(arrayLiteral: "First member", "Second member")
var anotherArr2 = NonEmptyArray(content: [] as [String])
//var anotherArr3: NonEmptyArray<String> = []

someArr[0]
someArr[1]
someArr.first
someArr.index(after: someArr.indices.endIndex)
someArr.count
someArr.numberOfElements



/*
 A peak element is an element that is strictly greater than its neighbors.

 Given an integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

 You may imagine that nums[-1] = nums[n] = -∞.

 You must write an algorithm that runs in O(log n) time.

  

 Example 1:
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 
 Example 2:
 Input: nums = [1,2,1,3,5,6,4]
 Output: 5
 Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
  
 */

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    if nums.count == 1 {
        return 0
    }
    
    while left <= right {
        let pivot = (left + right) / 2
        if nums[pivot] > nums[pivot + 1] && nums[pivot] > nums[pivot - 1] {
            return pivot
        } else if nums[pivot] < nums[left] {
            right = pivot - 1
        } else if nums[pivot] > nums[left] {
            left = pivot + 1
        } else {
            return nums.count - 1
        }
    }
    return 100
}

//findPeakElement([1,2,3,1])
//findPeakElement([1,2,1,3,5,6,4])
//findPeakElement([1])
//findPeakElement([1, 2])
findPeakElement([6,5,4,3,2,3,2])
