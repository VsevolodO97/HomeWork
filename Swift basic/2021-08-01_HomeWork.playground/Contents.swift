import UIKit

/*
 1. Разобраться с markdown. Написать расширенное пояснение к проекту и домашним работам в этом формате https://gist.github.com/Jekins/2bf2d0638163f1294637

 2. Написать функцию с именем printFullName, которая принимает две строки с именами firstName и lastName. Функция должна распечатать полное имя, определенное как firstName + "" + lastName.

 3. Написать функцию с именем calculateFullName, которая возвращает tuple (кортеж), содержащий как полное имя, так и длину имени (для получения длины строки можно использовать свойство count).

 4. Изучить использование функции stride
 https://developer.apple.com/documentation/swift/1641347-stride
 https://developer.apple.com/documentation/swift/1641185-stride
 https://www.hackingwithswift.com/example-code/language/using-stride-to-loop-over-a-range-of-numbers

 И написать цикл от 10,0 до 9,0 (включительно) с уменьшением на 0,1.

 5. Реализовать функцию определения, является ли число простым
 func isPrime(_ number: Int) -> Bool
 https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%BE%D1%81%D1%82%D0%BE%D0%B5_%D1%87%D0%B8%D1%81%D0%BB%D0%BE
 */

/*
 2. Написать функцию с именем printFullName, которая принимает две строки с именами firstName и lastName. Функция должна распечатать полное имя, определенное как firstName + "" + lastName.
 */
func printFullName(firstName: String, lastName: String) {
    print(firstName + " " + lastName)
}
printFullName(firstName: "Alexander", lastName: "Kurbatov")

/*
 3. Написать функцию с именем calculateFullName, которая возвращает tuple (кортеж), содержащий как полное имя, так и длину имени (для получения длины строки можно использовать свойство count).
 */

func calculateFullName(firstName: String, lastName: String) -> (String, Int){
    let fullName = (firstName + " " + lastName)
    let nameLength = firstName.count
    return (fullName, nameLength)
}
calculateFullName(firstName: "Alexander", lastName: "Kurbatov")

/*
 4. Изучить использование функции stride
 https://developer.apple.com/documentation/swift/1641347-stride
 https://developer.apple.com/documentation/swift/1641185-stride
 https://www.hackingwithswift.com/example-code/language/using-stride-to-loop-over-a-range-of-numbers

 И написать цикл от 10,0 до 9,0 (включительно) с уменьшением на 0,1.
 */

for elements in stride(from: 10.0, through: 9.0, by: -0.1) {
    print(elements)
}

/*
 5. Реализовать функцию определения, является ли число простым
 func isPrime(_ number: Int) -> Bool
 */

// Реалиация функции определения простоты числа с помощью алгоритма Перебор делителей
func isPrime(_ number: Int) -> Bool {
    let maxDivider = Int(sqrt(Double(number)))
    for i in 2...maxDivider {
        if number % i == 0 {
            print("The number \(number) is composite number.")
            return false
        }
    }
    print("The number \(number) is prime number.")
    return true
}

isPrime(7399)
  
