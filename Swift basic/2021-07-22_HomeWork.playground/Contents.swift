import UIKit

//Task 1.1. Создать tuple, описывающий трехмерную систему координат, и дать его типу псевдоним

// Объявляем новый псевдоним типа данных
typealias Coordinates = (x: Int, y: Int, z: Int)
// Создем tuple  c псевдонимом типа Coordinates
let cityCoordinates: Coordinates = (x: 10, y: 20, z: 30)
print(cityCoordinates)

//1.2. Создать второй экземпляр tuple, используя alias.
let anotherCoordinates: Coordinates = (1, 2, 4)
// Создадим еще один tuple через приведение типов
let kskd = (1, 3, 5) as Coordinates

// 2. Изучить format для строк, привести несколько примеров форматированного вывода различных чисел (Int, UInt, Float, Double)
// Пример форматированного вывода числа Int
let integerMaxNum = String(format: "Maxinum number of Int.32 is %d", Int32.max)
print(integerMaxNum)
//Пример форматированного вывода числа UInt
let uIntegerMaxNumber = String(format: "Maximum number of UInt.64 is %u", UInt64.max)
print(uIntegerMaxNumber)
let maxUint8Num = String(format: "Maximum number of UInt8 is %u", UInt8.max)
print(maxUint8Num)
//Пример форматированного вывода числа Float
let floatNumber = String(format: "Float number is %f", Float(20))
print(floatNumber)
//Пример форматированного вывода числа Double
let doubleNumber = String(format: "Double number is %f", Double(50))
print(doubleNumber)
