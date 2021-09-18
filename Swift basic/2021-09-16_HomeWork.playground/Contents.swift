import UIKit

/*
 1. Есть enum
 
 enum Coin: Int {
   case penny = 1
   case nickel = 5
   case dime = 10
   case quarter = 25
 }

 И массив экземпляров

 let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

 Написать функцию, принимающую массив монет и возвращающую общую сумму.
 */

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func sum(array: [Coin]) -> Int {
   return array.map {$0.rawValue}.reduce(0, { x, y in x + y })
}

print("Summ of coins is \(sum(array: coinPurse)) cents")

/*
 2. Есть enum

 enum Month: Int {
   case january = 1, february, march, april, may, june, july, august, september, october, november, december
 }

 Написать computed property получения количества месяцев до лета. Нужно учесть отрицательное значение, если лето в текущем году уже прошло.
 */

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    var countMonthToSummer: Int {
        switch self {
        case .june, .july, .august:
            print("It's summer now!")
            return 0
        case .january, .february, .march, .april, .may:
            print("You should wait \(6 - self.rawValue) months to summer.")
            return 6 - self.rawValue
        case .september, .october, .november, .december:
            print("You should wait \(12 - self.rawValue + 6) months to summer.")
            return 12 - self.rawValue + 6
        }
//       return 0
    }
}
Month.december.rawValue
let currentMonth: Month = .december
currentMonth.countMonthToSummer

/*
 1. Есть два массива целых чисел. Нужно реализовать функцию, которая возвращает true, если каждое значение в первом списке имеет соответствующее значение, возведенное в квадрат, во втором списке. Размерность массивов  должна быть одинаковой, например. если в первом есть два значения, во втором должны существовать ровно два значения в квадрате.
 */

func compareTwoArrrays(firstArray: [Int], secondArray: [Int]) -> Bool {
    guard firstArray.count == secondArray.count else { // Поверяем размерности массивов. Если одинаковая - продолжеам выполнение программы
        print("Arrays could not be compared.")
        return false
    }
    for i in 0...firstArray.count - 1 {
        if secondArray[i] == Int(pow(Double(firstArray[i]), 2))  {
            continue
        } else {
            print("All elements of the second array are not elements of the first array raised to the second power.")
            return false
        }
    }
    print("All elements of the second array are elements of the first array raised to the second power.")
    return true
}

let array1 = [1, 3, 3, 5]
let array2 = [1, 9, 9, 25]

compareTwoArrrays(firstArray: array1, secondArray: array2)

/*
 2. Определить дублированный элемент в массиве, в котором содержатся элементы типа Int от 1 до 100, при условии, что в массиве дублируется только один элемент
 */

var arrayInts = Array(1...100)
arrayInts.insert(16, at: 35)

//arrayInts.sort()
func findEqualElements(array: [Int]) -> Int {
    let sortedArray = array.sorted()    // Сортируем массив, чтобы одинаковые числа находились рядом друг с другом
    var element: Int = 0
    for index in 0...sortedArray.count - 1 {    // Организовываем цикличный поиск одинаковых элементов
        if sortedArray[index] == sortedArray[index + 1] {
            element = sortedArray[index]
            break   // Прекращаем цикл поиска при нахождении двух одинаковых элементов
        }
    }
    return element
}

findEqualElements(array: arrayInts)

/*
 3. Задан массив целых чисел. Нужно создать из него два отсортированных по возрастанию массива, содержащих четные и нечетные числа
 */

func separetArray(array: [Int]) -> (evenArray: [Int], oddArray: [Int]) {
    var evenArray: [Int] = []
    var oddArray: [Int] = []
    for element in array {
        if element % 2 == 0 {
            evenArray.append(element)
        } else {
            oddArray.append(element)
        }
    }
    evenArray.sort()
    oddArray.sort()
    return (evenArray, oddArray)
}

arrayInts.sort(by: >)
print(separetArray(array: arrayInts))
