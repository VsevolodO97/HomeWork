import UIKit

/*
 1. Задачу с leetcode реализовать через 2 "бегунка"
 "Given a binary array nums, return the maximum number of consecutive 1's in the array"
 */

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var maxConsecutive: Int = 0
    var onesCount = 0
    for i in 0...nums.count - 1 {
        if nums[i] == 1 && i != nums.count - 1 {
            onesCount += 1
        } else if nums[i] == 1 && i == nums.count - 1 {
            onesCount += 1
            if onesCount > maxConsecutive {
                maxConsecutive = onesCount
            }
        } else if nums[i] == 0 {
            if onesCount > maxConsecutive {
                maxConsecutive = onesCount
            }
            onesCount = 0
        }
    }
    return maxConsecutive
}

findMaxConsecutiveOnes([1, 1, 0, 1, 1, 1])

/*
 2. Взять еще одну задачу с leetcode
 Given an array nums of integers, return how many of them contain an even number of digits.
 */

let nums = [12, 345, 2, 6, 7896]
func findNumbers(_ nums: [Int]) -> Int {
    nums.map { String($0).count }.filter { $0 % 2 == 0 }.count
   }
findNumbers(nums)

/*
 3. Почитать и проанализировать про @frozen

 https://www.avanderlee.com/swift/unknown-default-enums-in-swift/
 https://useyourloaf.com/blog/swift-5-frozen-enums/
 
 Про @uunknown понял, что используется для обработки новый значений в enum, которые могут появиться в будущем. Это касается API.
 Про frozen не понял. Такой синтаксис спйчас не используется?
 */

/*
 4. Есть enum


 enum Direction {
   case north
   case south
   case east
   case west
 }


 Он описывает движения персонажа в игре. Игрок делает следующую последовательность шагов (1 шаг = смещение на 1 по оси координат)


 let movements: [Direction] = [.north, .north, .west, .south, .west, .south, .south, .east, .east, .south, .east]


 Написать функцию, возвращающую позицию персонажа. Оси координат направлены вправо и в низ, игрок начинал в точке (0,0)

 Для описания позиции можно использовать tuple


 var location = (x: 0, y: 0)
 */

enum Direction {
  case north
  case south
  case east
  case west
}

let movements: [Direction] = [.north, .north, .west, .south, .west, .south, .south, .east, .east, .south, .east]

func moving(movements: [Direction]) -> (x: Int, y: Int) {
    var location = (x: 0, y: 0)
    for movmemt in movements {
        switch movmemt {
        case .north:
            location.y -= 1
        case .east:
            location.x += 1
        case .south:
            location.y += 1
        case .west:
            location.x -= 1
        }
    }
    return location
}

moving(movements: movements)

/*
 5. Создать протоколы для задач зоомагазина с собаками, кошками, рыбками и птицами.
 В обязанности зоомагазина входят следующие задачи:
 - Всех питомцев нужно кормить.
 - Домашние животные, которые могут летать, должны быть помещены в клетки.
 - Питомцев, которые умеют плавать, нужно поместить в аквариум.
 - Домашние животные, которые гуляют, нуждаются в физических упражнениях.
 - Аквариумы и клетки необходимо время от времени чистить.

 Нужно

 - создать классы или структуры для каждого животного и законформить соответствующие протоколы. Для реализации методов можно использовать оператор print ()
 - создать однородные массивы для животных, которых нужно кормить, помещать в клетки, чистить, выгуливать и помещать в цистерны. Добавить в эти массивы соответствующих животных. Массивы следует объявлять с использованием протокола в качестве типа элемента, например


 var caged: [Cageable]


 - написать цикл, который будет выполнять соответствующие задачи (такие как кормление, клетка, прогулка) для каждого элемента каждого массива
 */

protocol Feeding {
    func feed()
}

protocol Cageable {
    func putInCage()
}

protocol PlacementInAquarium {
    func putInAquarium()
}

protocol PhysicalActivity {
    func doingPhysicalActivity()
}

protocol CleaningCage {
    func clean()
}

protocol CleaningAquarium {
    func clean()
}

struct Cat: Feeding {
    func feed() {
        print("The cat is fed.")
    }
}

struct Dog: Feeding, PhysicalActivity {
    func feed() {
        print("The dog is fed.")
    }
    
    func doingPhysicalActivity() {
        print("The dog is walked.")
    }
}

struct Fish: Feeding, PlacementInAquarium, CleaningAquarium {
    func feed() {
        print("The fish is fed.")
    }
    
    func putInAquarium() {
        print("The fish is placed in the aquarium.")
    }
    
    func clean() {
        print("Aquarium cleaned.")
    }
}

struct Bird: Feeding, Cageable, CleaningCage {
    let name: String
    func feed() {
        print("The bird is fed.")
    }
    
    func putInCage() {
        print("The bird caged.")
    }
    
    func clean() {
        print("Cage cleaned.")
    }
}

let martin = Bird(name: "Martin")
let eagle = Bird(name: "Eagle")

let scottishFold = Cat()
let oriental = Cat()

let shepherd = Dog()
let dog = Dog()

let clownFish = Fish()
let tunaFish = Fish()

var fed: [Feeding] = [martin, eagle, scottishFold, oriental, shepherd, dog, clownFish, tunaFish]
var caged: [Cageable] = [martin, eagle]
var aquariumed: [PlacementInAquarium] = [clownFish, tunaFish]
var cleanedCage: [CleaningCage] = [martin, eagle]
var cleanedAquarium: [CleaningAquarium] = [clownFish, tunaFish]

//caged[0].putInCage()

for pet in fed {
    pet.feed()
}

for pet in caged {
    pet.putInCage()
}

for pet in aquariumed {
    pet.putInAquarium()
}

for pet in cleanedCage {
    pet.clean()
}

for pet in cleanedAquarium {
    pet.clean()
}
