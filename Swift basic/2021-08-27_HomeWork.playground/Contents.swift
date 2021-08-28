import UIKit

/*
 1. Дана структура

 struct Circle {
   
   var radius = 0.0

   var area: Double {
     .pi * radius * radius
   }

 }

 Написать метод, который может изменять площадь экземпляра структуры Circle за счет фактора роста. Например, если  вызвать circle.grow (byFactor: 3), площадь экземпляра утроится.

 2. Добавить методы с именами isEven и isOdd в namespace Math, которые возвращают true, если число четное или нечетное соответственно.

 3. Добавить computed properties isEven и isOdd к структуре Int с помощью extension.
 */

// Первое задание

struct Circle {
    
    var radius = 0.0
    
    var area: Double {
        get {
        .pi * radius * radius
        }
        set {
            radius = newValue   // определяем сеттер, для изменения радиуса окружности исходя из нового значения площади
        }
    }
    // определяем функцию, которая увеличивает площадь окружности на заданное значение
    mutating func grow(byFactor: Int) -> Double {
        let newArea = area * Double(byFactor)   // находим новую площадь
        radius = sqrt(newArea / .pi)    // вычисляем радиус для новой окружности
        return radius
    }
}

var circle = Circle(radius: 5)
circle.area
circle.radius
circle.grow(byFactor: 5)
circle.area
circle.radius

/*
 2. Добавить методы с именами isEven и isOdd в namespace Math, которые возвращают true, если число четное или нечетное соответственно.
 */

struct Math {
    
    func isEven(number: Int) -> Bool {
        number % 2 == 0
    }
    func isOdd(number: Int) -> Bool {
        number % 2 != 0
}
}
var someNumber = Math()
someNumber.isEven(number: 0)
someNumber.isOdd(number: 0)

//  3. Добавить computed properties isEven и isOdd к структуре Int с помощью extension.
extension Int {
    var isEvev: Bool {
        self % 2 == 0
    }
    var isOdd: Bool {
        self % 2 != 0
    }
}

var number: Int = 0
number.isEvev
number.isOdd

