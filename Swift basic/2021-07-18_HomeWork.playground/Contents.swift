import UIKit

/*
 1. Объявить константу Int с именем myAge и установить ее в соответствии с текущим возрастом. Также объявить переменную Int с именем dogs и установить ее равной количеству собак у тебя. Представить, что появился новый щенок и увеличить значение переменной dog на единицу
*/

let myAge: Int = 41
var dogs: Int = 0

dogs += 1

print(dogs)

/*
 2. Исправить код ниже
 age: Int = 16
 print(age)
 age = 30
 print(age)
 */

var age: Int = 16
print(age)
age = 30
print(age)

/*
 3. Расставить скобки в выражении
 8 - 4 * 2 + 6 / 3 * 4
 не изменив его значение
 */

print(8 - 4 * 2 + 6 / 3 * 4)
print((8 - (4 * 2)) + ((6 / 3) * 4))

/*
 4. Объявить три константы с именами rating1, rating2 и rating3 типа Double и присвоить каждой значение. Вычислить среднее из трех и сохранить результат в константе с именем averageRating
 */

let rating1: Double = 10
let rating2 = 20.0
let rating3 = 30.0

// Решение 1
let averageRating = (rating1 + rating2 + rating3) / 3

// Решение 2
let ratingArray = [rating1, rating2, rating3]

var anotherAverageRating = Double()

func countAverage (from array:[Double]) -> Double {
    var total = Double()
    for rating in array {
        total += rating
    }
    anotherAverageRating = total / Double(array.count)
    
    return anotherAverageRating
}

anotherAverageRating = countAverage(from: ratingArray )

/*
 5. Для генерации случайного числа используется функция arc4random(). Она выбирает число от 0 до 4294967295 и возвращает его. Можно использовать оператор деления по модулю, чтобы усечь это случайное число до любого желаемого диапазона.
 
 Нужно объявить константу randomNumber и присвоить ей случайное число, сгенерированное с помощью arc4random(). Затем вычислить константу, называемую diceRoll, и использовать только что найденное случайное число, чтобы создать случайное от 1 до 6.
 */

// Объявляем константу, которую необходимо вычислить на основе функции arc4random() и создать случайное число от 1 до 6
let diceRoll: Int
// Объявляем промежуточную переменную, которую можно будет менять при невыполнении граничных условий
var number: Int = 0
// Создаём цикл, который будет складывать все цифры случайного числа и задавать новое случайное число, пока итоговое чило не получится в диапазоне от 1 до 6
repeat {
    // Объявляем константу randomNumber и присваиваем ей случайное число
    let randomNumber = arc4random()
    // Интерполируем число в строковую переменную
    var randomString = "\(randomNumber)"
    // Складываем все цифры полученного числа
    for character in randomString {
        number += Int(String(character))!
    }
    // Создаем цикл, который будет складывать цифры полученного числа до тех пор, пока оно не будет состоять из одной цифры
    while String(number).count > 1 {
        randomString = String(number)
        number = 0
        for character in randomString {
            number += Int(String(character))!
        }
    }
    // Проверяем граничные условия: результат должен лежать в диапазоне от 1 до 6
} while (number != 0) && (number > 6)
// Присваеваем константе diceRoll вычисленое значение
diceRoll = number
// Выводим на печать вычисленную константу
print(diceRoll)

// А теперь правильное решение
let randomNumber = arc4random()
let diceRollRightAnswer = randomNumber % 6 + 1

