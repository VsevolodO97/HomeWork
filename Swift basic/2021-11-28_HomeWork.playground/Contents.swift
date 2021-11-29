import UIKit

/*
 1. Создать коллекцию "Числа Фибоначчи"
 2. Доделать задачу с leetcode
 3. Почитать

 - https://oleb.net/blog/2017/02/why-is-dictionary-not-a-mutablecollection/
 - https://www.swift.org/blog/swift-collections/
 - https://www.swiftbysundell.com/articles/creating-custom-collections-in-swift/
 - https://dzone.com/articles/arrayslice-in-swift
 */

struct FibonachiCollection {
    private var fibonachiArray: [UInt] = []
    private(set) var numbersOfFibonachiArray: UInt
    
    init(numbersOfFibonachiArray: UInt) {
        self.numbersOfFibonachiArray = numbersOfFibonachiArray
        self.fibonachiArray = createFibonachiArray(for: numbersOfFibonachiArray)
    }
    // !!! Инициализировать последовательностью нам нельзя, так наша коллекция вычисляемая. Но я не понял, как написать этот инициализатор в данном случае
    //    init<S: Sequence>(_ sequence: S) where
    //    S.Iterator.UInt == UInt {
    //        for element in sequence {
    //            add(element)
    //        }
    //    }
    
    private mutating func createFibonachiArray(for number: UInt) -> [UInt] {
        for i in 0...number {
            fibonachiArray.append(findFibonachi(for: i))
        }
        return fibonachiArray
    }
    
    func findFibonachi(for number: UInt) -> UInt {
        var fibonachiNumber: UInt = 0
        if number == 0 {
            fibonachiNumber = 0
        } else if number == 1 {
            fibonachiNumber = 1
        } else {
        fibonachiNumber = findFibonachi(for: number - 1) + findFibonachi(for: number - 2)
        }
        return fibonachiNumber
    }
    
    func showFibArr() -> [UInt]{
        return fibonachiArray
    }
    mutating func changeFibonachiArray(for newNumber: UInt) -> [UInt] {
        fibonachiArray.removeAll()
        numbersOfFibonachiArray = newNumber
        fibonachiArray = createFibonachiArray(for: newNumber)
        return fibonachiArray
    }
}

extension FibonachiCollection: Sequence {
    typealias Iterator = AnyIterator<UInt>
    
    func makeIterator() -> Iterator {
       var iterator = fibonachiArray.makeIterator()
        return AnyIterator {
            iterator.next()
        }
    }
}

struct FibonachiCollectionIndex {
    var index = Array<UInt>.Index()
    
    init(_ arrayIndex: Array<UInt>.Index) {
        self.index = arrayIndex
    }

}

extension FibonachiCollectionIndex: Comparable {
    static func < (lhs: FibonachiCollectionIndex, rhs: FibonachiCollectionIndex) -> Bool {
        lhs.index < rhs.index
    }
    
    static func == (lhs: FibonachiCollectionIndex, rhs: FibonachiCollectionIndex) -> Bool {
        lhs.index == rhs.index
    }
}

extension FibonachiCollection: Collection {
    typealias Index = FibonachiCollectionIndex
    
    var startIndex: Index {
        FibonachiCollectionIndex(fibonachiArray.startIndex)
    }
    var endIndex: Index {
        FibonachiCollectionIndex(fibonachiArray.endIndex)
    }
    
    func index(after i: Index) -> Index {
        Index(fibonachiArray.index(after: i.index))
    }
    
    subscript(position: Index) -> Iterator.Element {
        fibonachiArray[position.index]
    }
}
extension FibonachiCollection {
    subscript(index: Int) -> UInt {
        get {
            return fibonachiArray[index]
        }
//        set(newValue) {
//            fibonachiArray[index] = newValue
//        }
    }
}

extension FibonachiCollection: CustomStringConvertible {
    var description: String {
       return "Ряд Фибоначи до числа \(numbersOfFibonachiArray): \(fibonachiArray)"
    }
}

extension FibonachiCollection: ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = UInt
    
    init(integerLiteral value: UInt) {
        self.numbersOfFibonachiArray = value
        self.fibonachiArray = createFibonachiArray(for: numbersOfFibonachiArray)
    }
}

var structFib = FibonachiCollection(numbersOfFibonachiArray: 5)
print(structFib)
structFib.showFibArr()
//structFib[5] = 77
//print(structFib)

structFib.numbersOfFibonachiArray
structFib.changeFibonachiArray(for: 4)
//structFib.numbersOfFibonachiArray = 77
//structFib.numbersOfFibonachiArray
structFib.showFibArr()
print(structFib)


var anotherStructFib = FibonachiCollection(integerLiteral: 10)

let a: FibonachiCollection = 8
print(a)
