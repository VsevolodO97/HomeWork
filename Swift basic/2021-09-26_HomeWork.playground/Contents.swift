import UIKit

/*
 1. Есть два массива целых чисел. Нужно реализовать функцию, которая возвращает true, если каждое значение в первом списке имеет соответствующее значение, возведенное в квадрат, во втором списке. Размерность массивов  должна быть одинаковой, например. если в первом есть два значения, во втором должны существовать ровно два значения в квадрате. Порядок элементов в двух массивах неважен

 2. Определить дублированный элемент в массиве, в котором содержатся все элементы типа Int от 1 до 100, при условии, что в массиве дублируется только один элемент (то есть массив содержит 101 элемент). Решить задачу, используя суммирование

 3. Определить дублированный элемент в массиве, в котором содержатся элементы типа Int от 1 до 100, при условии, что в массиве дублируется только один элемент. Элементов в массиве меньше 100. Решить задачу, используя множества.

 4. Реализовать на leetcode хотя бы одну задачу из блока Array

 5. Почитать и проанализировать про @frozen

 https://www.avanderlee.com/swift/unknown-default-enums-in-swift/
 https://useyourloaf.com/blog/swift-5-frozen-enums/

 6. Есть enum


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


/*
 1. Есть два массива целых чисел. Нужно реализовать функцию, которая возвращает true, если каждое значение в первом списке имеет соответствующее значение, возведенное в квадрат, во втором списке. Размерность массивов  должна быть одинаковой, например. если в первом есть два значения, во втором должны существовать ровно два значения в квадрате. Порядок элементов в двух массивах неважен
 */

func compareTwoArrrays(firstArray: [Int], secondArray: [Int]) -> Bool {
    var secondTempArr = secondArray
    
    guard firstArray.count == secondArray.count else { // Поверяем размерности массивов. Если одинаковая - продолжеам выполнение программы
        print("Arrays could not be compared.")
        return false
    }

    for i in 0...firstArray.count - 1 { // Цикл для перебора элементов первого массива
        var match = Bool()  // Создаем переменную, которая будет индикатором совпадения элеменов двух массивов по условию х = у^2
        for j in 0...secondTempArr.count - 1 {  //  цикл для перебора элементов второго массива
            if secondTempArr[j] == Int(pow(Double(firstArray[i]), 2))  {    // Проверка условия х = у^2
                match = true
                //firstTempArr.remove(at: i)
                secondTempArr.remove(at: j) // Удаляем найденный элемент из массива
                break   // Прерываем цикл при нахождении элемента, удовлетворяющего условию х = у^2
            }
        }
        if match != true {  // Производим проверку: если совпадение, удовлетворяющее условию х = у^2 не найдено, то прерываем проверку и возвращаем false
            print("All elements of the second array are not elements of the first array raised to the second power.")
            return false
        }
    }
    print("All elements of the second array are elements of the first array raised to the second power.")
    return true
}

let array1 = [1, 3, 5, 4, 5]
let array2 = [25, 9, 1, 16, 25]

compareTwoArrrays(firstArray: array1, secondArray: array2)

/*
 2. Определить дублированный элемент в массиве, в котором содержатся все элементы типа Int от 1 до 100, при условии, что в массиве дублируется только один элемент (то есть массив содержит 101 элемент). Решить задачу, используя суммирование
 */

var arrayInts = Array(1...100)
arrayInts.insert(16, at: 35)

//arrayInts.sort()
func findEqualElements(array: [Int]) -> Int? {
    var element: Int = 0
    for i in 0...array.count - 1 {
        for j in 0...array.count - 1 {
            if array[i] == array[j] && i != j {
                element = array[i]
                return element
            }
        }
    }
    return nil
}

findEqualElements(array: arrayInts)

func findEqual(array: [Int]) -> Int {
    var element: Int {
        return array.reduce(0, {x, y in x + y}) - Array(1...100).reduce(0, {x, y in x + y})
    }
    return element
}

findEqual(array: arrayInts)

/*
 3. Определить дублированный элемент в массиве, в котором содержатся элементы типа Int от 1 до 100, при условии, что в массиве дублируется только один элемент. Элементов в массиве меньше 100. Решить задачу, используя множества.
 */

var array = Array(1...10)
array.insert(1, at: 0)
array

func findEqualElem(array: [Int]) -> Int? {
    let mediumIndex: Int = array.count / 2
    var firstHalfArray = array
    var secondHalfArray = array
    firstHalfArray.removeFirst(mediumIndex)
    secondHalfArray.removeLast(secondHalfArray.count - mediumIndex)
    
    if firstHalfArray.count == Set(firstHalfArray).count && secondHalfArray.count == Set(secondHalfArray).count {
        return Set(firstHalfArray).intersection(Set(secondHalfArray)).first
    } else if firstHalfArray.count != Set(firstHalfArray).count {
        return findEqualElem(array: firstHalfArray)
    } else if secondHalfArray.count != Set(secondHalfArray).count{
        return findEqualElem(array: secondHalfArray)
    }
    
    // let equalElem = Set(firstHalfArray).intersection(Set(secondHalfArray)).first
    return nil
}

findEqualElem(array: array)

/*
 4. Реализовать на leetcode хотя бы одну задачу из блока Array
"Given a binary array nums, return the maximum number of consecutive 1's in the array"
 */
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var arrayOfConsecutives: [Int] = []
        var lenthMaxCons: Int = 0
        var count = 0
        for i in 0...nums.count - 1 {
          
            if nums[i] == 1 && i != nums.count - 1 {
                count += 1
            } else if nums[i] == 1 && i == nums.count - 1{
                count += 1
                arrayOfConsecutives.append(count)
                
            } else if nums[i] == 0 {
                arrayOfConsecutives.append(count)
                count = 0
            }
        }
        arrayOfConsecutives.sort()
        lenthMaxCons = arrayOfConsecutives.popLast()!
        return lenthMaxCons
    }
}

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var arrayOfConsecutives: [Int] = []
    var lenthMaxCons: Int = 0
    var count = 0
    for i in 0...nums.count - 1 {
      
        if nums[i] == 1 && i != nums.count - 1 {
            count += 1
        } else if nums[i] == 1 && i == nums.count - 1{
            count += 1
            arrayOfConsecutives.append(count)
            
        } else if nums[i] == 0 {
            arrayOfConsecutives.append(count)
            count = 0
        }
    }
    arrayOfConsecutives.sort()
    lenthMaxCons = arrayOfConsecutives.popLast()!
    return lenthMaxCons
}

findMaxConsecutiveOnes([1, 1, 0, 1, 1, 1])
