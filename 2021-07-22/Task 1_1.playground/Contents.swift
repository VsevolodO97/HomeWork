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


