import UIKit

/*
 1. Разобрать протоколы

 - Equatable
 - Comparable
 
 extension Date: Comparable {
     static func < (lhs: Date, rhs: Date) -> Bool {
         if lhs.year != rhs.year {
             return lhs.year < rhs.year
         } else if lhs.month != rhs.month {
             return lhs.month < rhs.month
         } else {
             return lhs.day < rhs.day
         }
     }
 
 !!! Вот тут не понял, как мы определяем, что если не равно, то обязательно меньше?
 
 - Hashable
 - Identifiable
 - CustomStringConvertible
 - ExpressibleByArrayLiteral

 привести примеры использования
 */

class Person {
    let id: Int
    let name: String
    var age: Int
    
    init(id: Int, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
}

// Пример использования протокола Equatable
let ivan = Person(id: 01, name: "Ivan", age: 25)
let stepan = Person(id: 02, name: "Stepan", age: 35)
ivan == stepan  // До того, как класс Person законформил протокол Equatable, функция сравнения не выполнялась

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.age == rhs.age
    }
}
ivan == stepan
let ivan2 = ivan
ivan == ivan
let stepan2 = Person(id: 02, name: "Stepan", age: 35)
stepan == stepan2
stepan === stepan2
ivan === ivan2

// Пример использования протокола Comparable
var arrayOfPersons: [Person] = [ivan, stepan2, ivan2, stepan]
arrayOfPersons.sorted() // До того, как класс Person законформил протокол Comparable, функция сортировки не выполнялась

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        if lhs.id != rhs.id {
            return lhs.id < rhs.id
        } else if lhs.name != rhs.name {
            return lhs.name < rhs.name
        } else {
            return lhs.age < rhs.age
        }
    }
}

// Пример использования протокола Hashable
var setOfPerson: Set = [ivan, stepan, ivan2, stepan2]   // До того, как класс Person законформил протокол Hashable, создать Set из объектов типа Person было не возможно
setOfPerson
extension Person: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(age)
    }
}

// Пример использования протокола Identifiable





/*
 2. Решить еще одну задачу с leetcode
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 */
var nums = [-4,-1,0,3,10]
func sortedSquares(_ nums: [Int]) -> [Int] {
    nums.map { Int(pow(Double($0), 2)) }.sorted()
   }

//func sortedSquares(_ nums: [Int]) -> [Int] {
//    var newArray: [Int] = []
//    for element in nums {
//        newArray.append(element * element)
//    }
//    return newArray.sorted()
//   }

sortedSquares(nums)
