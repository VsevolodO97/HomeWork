import UIKit

/*
 1. Описать tuple для хранения параметров прямоугольника (2 свойства: позиция (состоит из двух примитивов x, y); размер (длина, ширина))

 Написать функцию, которая, используя switch, рассказывает, где находится прмоугольник:

 - “Прямоугольник размера 100 x 30 находится в начале координат” - (0, 0)(100, 30)
 - “Прямоугольник размера 100 x 30 находится на оси X со сдвигом по y на 10” - (0, 10)(100, 30)
 - “Прямоугольник размера 100 x 30 находится на оси Y со сдвигом по x на 10” - (10, 0)(100, 30)
 - “Прямоугольник размера 10 x 30 находится в точке (10, 15)” - (10, 15)(10, 30)”

 2. Реализовать функцию возведения в степень


 pow(2, 1) // 2
 pow (2, 2) // 4
 pow (10, 3) // 1000


 3. Написать функцию, возвращающую самое длинное слово из строки.


 longestWord("big flower") // flower
 longestWord("this is a house") // house


 4. Отфильтровать массив целых чисел, оставив в нем только нечетные.

 5. Написать функцию вычисления медианы числового ряда

 Медиана

 6. Реализовать первую задачу, используя структуры
 7. Описать структуру Куб

 - Должна возвращать свой объем
 - реагировать на изменение грани
 - иметь инициализатор с дефолтным параметром
 */

/*  1. Описать tuple для хранения параметров прямоугольника (2 свойства: позиция (состоит из двух примитивов x, y); размер (длина, ширина))

Написать функцию, которая, используя switch, рассказывает, где находится прмоугольник:

- “Прямоугольник размера 100 x 30 находится в начале координат” - (0, 0)(100, 30)
- “Прямоугольник размера 100 x 30 находится на оси X со сдвигом по y на 10” - (0, 10)(100, 30)
- “Прямоугольник размера 100 x 30 находится на оси Y со сдвигом по x на 10” - (10, 0)(100, 30)
- “Прямоугольник размера 10 x 30 находится в точке (10, 15)” - (10, 15)(10, 30)”
*/
//struct Coordinates: Equatable {
//    var originX: Int
//    var originY: Int
//}
//struct Size: Equatable {
//    var sizeX: Int
//    var sizeY: Int
//}
var rectangle: ((originX: Int, originY: Int), (sizeX: Int, sizeY: Int))
func whereRectangle(rectangle: ((originX: Int, originY: Int), (sizeX: Int, sizeY: Int))) {
    switch rectangle.0 {
    case (0, 0):
        print("Прямоугольник размера \(rectangle.1.sizeX) x \(rectangle.1.sizeY) находится на начале оси координат - \(rectangle)")
    case (0, _):
        print("Прямоугольник размера \(rectangle.1.sizeX) x \(rectangle.1.sizeY) находится на оси X со сдвигом по оси Y на \(rectangle.0.originY) - \(rectangle)")
    case (_, 0):
        print("Прямоугольник размера \(rectangle.1.sizeX) x \(rectangle.1.sizeY) находится на оси Y со сдвигом по оси X на \(rectangle.0.originX) - \(rectangle)")
    default:
        print("Прямоугольник размера \(rectangle.1.sizeX) x \(rectangle.1.sizeY) находится в точке \(rectangle.0) - \(rectangle)")
    }
}

rectangle = ((5, 5), (10, 5))

whereRectangle(rectangle: rectangle)
whereRectangle(rectangle: ((originX: 0, originY: 0), (sizeX: 5, sizeY: 25)))

/*
 2. Реализовать функцию возведения в степень
 pow(2, 1) // 2
 pow (2, 2) // 4
 pow (10, 3) // 1000
 */

func pow(number: Int, pow: Int) -> Int {
    var resultOfPow: Int = number
    if pow == 0 {
        resultOfPow = 1
    } else if pow < 0 {
       print("Я еще не научился возводить в отрицательную степень")
    } else {
        for _ in 0..<(pow - 1){
            resultOfPow *= number
        }
    }
    return resultOfPow
}
pow(number: 5, pow: 0)

/*
 3. Написать функцию, возвращающую самое длинное слово из строки.
 longestWord("big flower") // flower
 longestWord("this is a house") // house
 */

func longestWord(someString: String) -> String? {
    if let word = someString.components(separatedBy: " ").max(by: { $0.count < $1.count } ) {
        return word
    }
    return nil
}
longestWord(someString: "big flower")
longestWord(someString: "this is a house")
longestWord(someString: "")

//  4. Отфильтровать массив целых чисел, оставив в нем только нечетные.

var array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
let evenArray = array.filter { $0 % 2 == 0 }
print(evenArray)

//  5. Написать функцию вычисления медианы числового ряда
func medianOfArray(array: [Int]) -> Double {
    var median: Double = 0
    if array.count % 2  == 0 {
        //  найдем медиану для массива чисел с четным набором элементов как среднее арифметическое двух чисел, находящихся в середине массива
        median = Double((array.sorted()[(array.count / 2) - 1] + array.sorted()[(array.count / 2)])) / 2
    } else {
        // найдем медиану для массива чисе с нечетным набором элементов как среднее число массива
        median = Double((array.sorted()[array.count / 2]))
    }
    return median
}

var array1 = [123, 78, 11, 95, 34, 67, 101, 356, 44, 73, 47]
var array2 = [23, 76, 34, 115, 6, 58, 88, 39, 17, 25, 7, 54, 49, 52]
print(medianOfArray(array: array1))
print(medianOfArray(array: array2))

//  6. Реализовать первую задачу, используя структуры

struct Coordinates: Equatable {
    var originX: Int = 0
    var originY: Int = 0
}
struct Size: Equatable {
    var sizeX: Int = 0
    var sizeY: Int = 0
}

struct Rect {
    var origin: Coordinates {
        didSet {
            switch origin.originX {
            case 0 where origin.originY == 0:
                print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на начале оси координат - (\(self.origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
            case 0:
                print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на оси X со сдвигом по оси Y на \(self.origin.originY) - (\(self.origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
            case _ where origin.originY == 0:
                print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на оси Y со сдвигом по оси X на \(self.origin.originX) - (\(self.origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
            default:
                print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится в точке \(self.origin.originX), \(self.origin.originY) - (\(self.origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
            }
        }
    }
    
    var size: Size
    
    init(origin: Coordinates, size: Size) {
        self.origin = origin
        switch origin.originX {
        case 0 where origin.originY == 0:
            print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на начале оси координат - (\(origin.originX), \(origin.originY)), (\(size.sizeX), \(size.sizeY))")
        case 0:
            print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на оси X со сдвигом по оси Y на \(origin.originY) - (\(origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
        case _ where origin.originY == 0:
            print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится на оси Y со сдвигом по оси X на \(origin.originX) - (\(origin.originX), \(self.origin.originY)), (\(size.sizeX), \(size.sizeY))")
        default:
            print("Прямоугольник размера \(size.sizeX) x \(size.sizeY) находится в точке (\(origin.originX), \(origin.originY)), (\(size.sizeX), \(size.sizeY)")
        }
        self.size = size
    }
}

var rect = Rect(origin: Coordinates(originX: 0, originY: 0), size: Size(sizeX: 5, sizeY: 5))
rect.origin.originX = 0
rect.origin.originY = 5

/*
 7. Описать структуру Куб

 - Должна возвращать свой объем
 - реагировать на изменение грани
 - иметь инициализатор с дефолтным параметром
 */

struct Cube {
    var edgeOfCube: Double {
        didSet {
            print(" The edge of cube was changed. New value is \(edgeOfCube) and new volume of cube is \(volumeOfCube)")
        }
    }
    var volumeOfCube: Double {
            return pow(edgeOfCube, 3.0)
    }
    
    init(edgeOfCube: Double = 10) {
        self.edgeOfCube = edgeOfCube
    }
}

var cube = Cube(edgeOfCube: 5)
cube.volumeOfCube
cube.edgeOfCube = 10

var anotherCube = Cube()
anotherCube.edgeOfCube
anotherCube.volumeOfCube
anotherCube.edgeOfCube = 5
anotherCube.volumeOfCube

var cube1 = Cube(edgeOfCube: 16)    // дефолтный инициализатор не сломался
cube1.edgeOfCube
cube1.volumeOfCube
