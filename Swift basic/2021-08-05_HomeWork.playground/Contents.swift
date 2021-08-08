import UIKit

/*
 1. Создать функцию, которая возвращает количество раз, когда целое число может быть разделено на другое целое число без остатка. Функция должна вернуть nil, если деление не дает целого числа.
 Затем написать код, который пытается развернуть опциональный результат. Предусмотреть два случая: в случае успеха выводить: “Yep, it divides \(answer) times”, а в случае неудачи выведите "Not divisible: [".

 Привести несколько (минимум 2) вариантов проверки работоспособности функции.

 2. Написать функцию, которая по названию книгу возвращает опциональный tuple с именем и фамилией автора книги.

 3. Написать ReadMe к репозиторию домашних работ, используя Markdown.
 */

/*
 1. Создать функцию, которая возвращает количество раз, когда целое число может быть разделено на другое целое число без остатка. Функция должна вернуть nil, если деление не дает целого числа.
 Затем написать код, который пытается развернуть опциональный результат. Предусмотреть два случая: в случае успеха выводить: “Yep, it divides \(answer) times”, а в случае неудачи выведите "Not divisible: [".

 Привести несколько (минимум 2) вариантов проверки работоспособности функции.
 */

func divisionFunc(number: Int) -> Int? {
    var count: Int = 0
    for i in stride(from: number - 1, to: 1, by: -1) {
        if number % i == 0 {
            count += 1
        }
    }
    if count == 0 {
        return nil
    }
    return count
}

// Первый вариант решения с помощью опционального связывания
func tryToPrintDivisible(number: Int) {
    let answer = divisionFunc(number: number)
    if let answer = answer {
        print("Yep, it divides \(answer) times")
    } else {
        print("Not divisible: It is prime number \(number)")
    }
    
}

tryToPrintDivisible(number: 12)

// Второй вариант решения с помощью опционального связывания
func tryToPrintDivisible2(number: Int) {
    let answer = divisionFunc(number: number)
    guard let answer = answer else {
        print("Not divisible: It is prime number \(number)")
        return
    }
    print("Yep, it divides \(answer) times")
}

tryToPrintDivisible2(number: 11)

// Третий вариант решения с помощью Оператора объединения по nil (нулевого связывания)
func tryToPrintDivisible3(number: Int) {
    let answer = divisionFunc(number: number) ?? 0
    if answer > 0 {
        print("Yep, it divides \(answer) times")}
    else {
        print("It divides \(answer) times It is prime number \(number)")
    }
}

tryToPrintDivisible3(number: 11)

let answer = divisionFunc(number: 11)
answer != nil ? print("Yep, it divides \(answer!) times") :  print("Not divisible: It is prime number")


// 2. Написать функцию, которая по названию книгу возвращает опциональный tuple с именем и фамилией автора книги.

var libraryOfBooks: [String: (String, String)?] = ["The Shining": ("Stephen", "King"), "Masha and the Bear": nil]

func getBooksAthor(bookName: String) -> (String, String)? {
  //  let authorName: (String, String)? = nil
    guard let authorName = libraryOfBooks[bookName] else {
        print("The author of the book \(bookName) is unknown")
        return nil
    }
    print("The author of the book \(bookName) is \(authorName!)")
  
    return authorName
}


getBooksAthor(bookName: "The Shining")
getBooksAthor(bookName: "The Masha and the Bear")
getBooksAthor(bookName: "The book")
//libraryOfBooks["The Shining"]
