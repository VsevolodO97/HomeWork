import UIKit

/*
 1. Разобрать, что такое lazy collection в Swift. Привести несколько примеров использования.

 2. Написать функцию, которая будет повторять переданную ей в качестве параметра функцию несколько раз


 func repeatTask(times: Int, task: () -> Void)


 3. Написать функцию, которая принимает в качестве аргумента целое число, а возвращает массив от 0 до переданного числа и обратно к нулю


 func countUpAndDown(n: Int) -> [Int]


 Например, n = 2, результат: [0, 1, 2, 1, 0]
 */

// 1. Разобрать, что такое lazy collection в Swift. Привести несколько примеров использования.

var numbers: [Int] = [1, 2, 3, 6, 9]
let modifiedNumbers = numbers
    .filter { number in
        print("Even number filter")
        return number % 2 == 0
    }.map { number -> Int in
        print("Doubling the number")
        return number * 2
    }
print(modifiedNumbers)
print(modifiedNumbers)

let modifiedLazyNumbers = numbers.lazy
    .filter { number in
        print("Lazy Even number filter")
        return number % 2 == 0
    }.map { number -> Int in
        print("Lazy Doubling the number")
        return number * 2
    }
print(modifiedLazyNumbers)
print(modifiedLazyNumbers.first!)
print(modifiedLazyNumbers)
print(modifiedLazyNumbers.last!)
print(modifiedLazyNumbers)

let usernames = ["Antoine", "Maaike", "Jaap", "Amber", "Lady", "Angie"]
usernames
    .filter { username in
        print("filtered name")
        return username.lowercased().first == "a"
    }.forEach { username in
        print("Fetch avatar for (username)")
    }

print("--------------------------")
usernames.lazy
    .filter { username in
        print("filtered name")
        return username.lowercased().first == "a"
    }.forEach { username in
        print("Fetch avatar for (username)")
    }

/*  lazy collection позволяет не делать вычислений по всей коллекции, пока не будет вызван определенный элемент.
 lazy collection не хранит в кэш всех предыдущих вычислений и заново делает их при повторном обращении к элементу.
 Удобно использовать при большом объеме данных, когда нужен доступ к конкретному элементу.
 !!! не понял, нужно ли его использовать при прокрутке экрана.
*/

//  2. Написать функцию, которая будет повторять переданную ей в качестве параметра функцию несколько раз

func repeatTask(times: Int, task: () -> Void) {
    for _ in 0...times - 1 {
        task()
    }
}

func printHello() {
    print("Hello world!")
}
repeatTask(times: 5, task: printHello)

/*
 3. Написать функцию, которая принимает в качестве аргумента целое число, а возвращает массив от 0 до переданного числа и обратно к нулю
 */

func countUpAndDown(n: Int) -> [Int] {
    var array: [Int] = []
    array.append(contentsOf: 0...n)
    for i in stride(from: n - 1, through: 0, by: -1) {
        array.append(i)
    }
   // print(array)
    return array
}

print(countUpAndDown(n: 5))
