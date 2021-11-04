import UIKit

/*
 1. На основе кода

 class Cat {
   var name: String

   init(name: String) {
     self.name = name
   }
 }

 class Dog {
   var name: String

   init(name: String) {
     self.name = name
   }
 }

 class Keeper<Animal> {
   var name: String
   var morningCare: Animal
   var afternoonCare: Animal

   init(name: String, morningCare: Animal, afternoonCare: Animal) {
     self.name = name
     self.morningCare = morningCare
     self.afternoonCare = afternoonCare
   }
 }


 Нужно реализовать возможность, при которой каждый смотритель в течение дня присматривает за изменяющимся количеством животных. Это может быть одно, два или десять животных на смотрителя, а не только утренние и дневные. Внешне это может выглядеть вот так


 let ivan = Keeper<Cat>(name: "Иван")

 ivan.lookAfter(someCat)
 ivan.lookAfter(anotherCat)


 Также нужно реализовать чтение количества наблюдаемых смотрителем животных и получение описание конкретного животного. Например, через свойство ivan.countAnimals и метод ivan.animalAtIndex(50) (нумерация с нуля)
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
let petr = Keeper<Dog>(
    name: "Пётр",
    morningCare: Dog(name: "Бобик"),
    afternoonCare: Dog(name: "Мухтар")
)
petr.morningCare
petr.listOfPets
petr.lookAfter(someDog)
petr.listOfPets
petr.countAnimals()
petr.animalAtIndex(0)
print(petr.animalAtIndex(1))
/*
 2. Сделать так, чтобы закомментированный код работал

 let a = 25.0
 let b = 34.0

 //let resultDouble = sumTwoValues(a, b)
 //print(resultDouble)

 let c = "ABC"
 let d = "DEF"

 //let resultString = sumTwoValues(c, d)
 //print(resultString)
 */


func sumTwoValues<T: AdditiveArithmetic>(_ x: T, _ y: T) -> T {
    let sum = x + y
    return sum
}

extension String: AdditiveArithmetic {
    public static func - (lhs: String, rhs: String) -> String {
        lhs
    }
    
    public static var zero: String {
      ""
    }
}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)


/*
 3. Задача с leetcode
 
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 
 Example 2:
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1

 */


func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low <= high {
        let middle = (low + high) / 2
        if nums[middle] == target {
            return middle
        } else if nums[middle] > target {
            high = middle - 1
        } else if nums[middle] < target {
            low = middle + 1
        }
    }
    return -1
}

search([-1,0,3,5,9,12], 2)
