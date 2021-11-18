import UIKit
import Foundation

/*

 Домашнее задание

 1. Почитать про subscript

 - https://learnappmaking.com/subscript-syntax-swift/
 - https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html
 - https://www.swiftbysundell.com/articles/the-power-of-subscripts-in-swift/

 5. Почитать про keypath

 - https://learnappmaking.com/swift-keypath-how-to/

 Alexander, [7 Nov 2021, 15:28:56]:
 Спасибо!
 */

//  2. Реализовать static subscript для enum месяцев года

enum Month: Int {
    case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    static subscript(n: Int) -> Month {
        assert(n > 0 && n <= 12, "Такого месяца года не существует.")
        return Month(rawValue: n)!
    }
}

let april = Month[4]
print(april)

/*
 3. Для класса class Keeper<Animal> из предыдущих занятий реализовать generic subscript, который по объекту животного возвращает факт нахождения у смотрителя, а при записи - добавляет животное к списку смотрителя
 */

class Cat: CustomStringConvertible {
    var description: String {
        "Кошка по имени \(name)"
    }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Dog: CustomStringConvertible {
    var description: String {
        "Собака по имени \(name)"
    }
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Dog: Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        lhs.name == rhs.name
    }
    
    
}


class Keeper<Animal> {

    var name: String
    private(set) var morningCare: Animal?
    private(set) var afternoonCare: Animal?
    var listOfPets = Array<Animal>()
    
    init(name: String, morningCare: Animal, afternoonCare: Animal) {
        self.name = name
        self.morningCare = morningCare
        listOfPets.append(morningCare)
        self.afternoonCare = afternoonCare
        listOfPets.append(afternoonCare)
    }
    
    init(name: String) {
        self.name = name
    }
}

extension Keeper {

    func lookAfter(_ pet: Animal) {
        listOfPets.append(pet)
    }
    
    func countAnimals() -> Int{
        let numberOfPets = listOfPets.count
        print("У смотрителя \(self.name) \(numberOfPets) животных.")
        return numberOfPets
    }
    
    func animalAtIndex(_ index: Int) -> Animal {
        listOfPets[index]
    }
}


let ivan = Keeper<Cat>(name: "Иван")

let someCat = Cat(name: "Барсик")
let anotherCat = Cat(name: "Снежок")

ivan.lookAfter(someCat)
ivan.lookAfter(anotherCat)
ivan.listOfPets
ivan.countAnimals()
print(ivan.animalAtIndex(0))
ivan.animalAtIndex(1)

let someDog = Dog(name: "Черныш")
let anotheDog = Dog(name: "Жучка")
let petr = Keeper<Dog>(
    name: "Пётр",
    morningCare: Dog(name: "Бобик"),
    afternoonCare: Dog(name: "Мухтар")
)
petr.morningCare
petr.listOfPets
petr.lookAfter(someDog)
petr.listOfPets.contains { $0.name == "Бобик" }
petr.countAnimals()
petr.animalAtIndex(0)
print(type(of: petr.listOfPets) )
print(petr.listOfPets)

extension Keeper where Animal: Equatable {
    
     subscript(_ pet: Animal) -> Animal? {
        get {
            guard self.listOfPets.contains(where: {$0 == pet}) else {
                return nil
            }
               return pet
        }
         set(newValue) {
            self.listOfPets.append(newValue!)
//            self.lookAfter(newValue!)
        }
    }
}

petr[someDog]
petr[anotheDog]
petr[anotheDog] = anotheDog // Вроде присвается, но синтаксис странный получился
print(petr.listOfPets)


// Этот subscript только читает и записывает значения в имеющемся диапазоне массива
extension Keeper {
    subscript(i: UInt) -> Animal {
        get {
            return self.listOfPets[Int(i)]
        }
        set(newValue) {
            self.listOfPets[Int(i)] = newValue
        }
    }
}
petr[1]
petr[2] = Dog(name: "!!!")
print(petr.listOfPets)
//petr.listOfPets.append(anotheDog)
//print(petr.listOfPets)

/*
 4. Еще одна задача с leetcode
 
 Given an array arr of integers, check if there exists two integers N and M such that N is the double of M ( i.e. N = 2 * M).

 More formally check if there exists two indices i and j such that :

 i != j
 0 <= i, j < arr.length
 arr[i] == 2 * arr[j]
  

 Example 1:

 Input: arr = [10,2,5,3]
 Output: true
 Explanation: N = 10 is the double of M = 5,that is, 10 = 2 * 5.
 Example 2:

 Input: arr = [7,1,14,11]
 Output: true
 Explanation: N = 14 is the double of M = 7,that is, 14 = 2 * 7.
 Example 3:

 Input: arr = [3,1,7,11]
 Output: false
 Explanation: In this case does not exist N and M, such that N = 2 * M.
  
 */

func checkIfExist(_ arr: [Int]) -> Bool {
    
    for i in 0...arr.count - 1 {
        for j in 0...arr.count - 1 {
            if arr[i] == 2 * arr[j] && i != j {
                return true
            }
        }
    }
    return false
   }

checkIfExist([-2,0,10,-19,4,6,-8])

/*
 4. Еще одна задача с leetcode
 
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns 3 possible results:

 -1: The number I picked is lower than your guess (i.e. pick < num).
 1: The number I picked is higher than your guess (i.e. pick > num).
 0: The number I picked is equal to your guess (i.e. pick == num).
 Return the number that I picked.

  

 Example 1:
 Input: n = 10, pick = 6
 Output: 6
 
 Example 2:
 Input: n = 1, pick = 1
 Output: 1
 
 Example 3:
 Input: n = 2, pick = 1
 Output: 1
 
 Example 4:
 Input: n = 2, pick = 2
 Output: 2
*/
//func guess(num: Int) -> Int {
//
//}
//
//
//func guessNumber(_ n: Int) -> Int {
//    let array = Array(1...n)
//    var low = 0
//    var high = array.count - 1
//
//    while low <= high {
//        let middle = (low + high) / 2
//        if array[middle] ==
//    }
//
//
//    return n
//    }
//
////  Forward declaration of guess API.
////  @param  num -> your guess number
////  @return          -1 if the picked number is lower than your guess number
////                   1 if the picked number is higher than your guess number
////                otherwise return 0
////  func guess(_ num: Int) -> Int
//
//
//class Solution : GuessGame {
//    func guessNumber(_ n: Int) -> Int {
//
//    }
//}
//int guess(int num)
