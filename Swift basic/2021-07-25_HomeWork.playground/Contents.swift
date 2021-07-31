import UIKit

/*
 1. Создать две строковые константы: первая - твое имя, вторая - мое. Сравнить, кто идет раньше по алфавиту.
 
 2. Создать tuple, описывающий имя и фамилию человека. Создать две константы этого tuple: первая - твое имя, вторая - мое. Сравнить 2 tuple.
 https://stackoverflow.com/a/53266743/932239
 https://developer.apple.com/documentation/swift/comparable (блок Tuple Comparison)
 
 3. Сколько дней в месяце?
 
 На основе месяца (String, название месяца в нижней регистре) и года (Int), нужно вычислить количество дней в месяце. Если номер года кратен 4, то год является високосным и «февраль» имеет 29 дней. Исключения: если номер года кратен 100, он не является високосным. Исключение из исключения: если номер года кратен 400, год является високосным 😬
 
 4. Зная число, определить следующую степень двойки, большую или равную этому числу.
 
 5. Зная число, вычислить треугольное число глубиной, равной этому числу.
 https://ru.wikipedia.org/wiki/%D0%A2%D1%80%D0%B5%D1%83%D0%B3%D0%BE%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5_%D1%87%D0%B8%D1%81%D0%BB%D0%BE
 
 6. Вычислить n-ое число последовательности Фибоначчи.
 https://ru.wikipedia.org/wiki/%D0%A7%D0%B8%D1%81%D0%BB%D0%B0_%D0%A4%D0%B8%D0%B1%D0%BE%D0%BD%D0%B0%D1%87%D1%87%D0%B8
 
 7. Распечатать таблицу, показывающую количество комбинаций для создания каждого числа от 2 до 12 при 2 бросках шестигранных игральных костей.
 */

// 1. Создать две строковые константы: первая - твое имя, вторая - мое. Сравнить, кто идет раньше по алфавиту.

let mentorName: String = "Aleksandr Sychev"
let menteeName = "Alexander Kurbatov"
let whichIsTheFirst = mentorName < menteeName ? "The mentor's name is the first in alfabet" : "The mentee's name is the first in alfabet"
print(whichIsTheFirst)
// С помощью тернарного оператора и операции сравнения ">" определили, что имя ментора идёт раньше по алфавиту

/*
 2. Создать tuple, описывающий имя и фамилию человека. Создать две константы этого tuple: первая - твое имя, вторая - мое. Сравнить 2 tuple.
 https://stackoverflow.com/a/53266743/932239
 https://developer.apple.com/documentation/swift/comparable (блок Tuple Comparison)
 */

typealias firstLastName = (firstName: String, lastName: String)
let mentor: firstLastName = (firstName: "Aleksandr", lastName: "Sychev")
let mentee: firstLastName = ("Alexander", "Kurbatov")
let whichFirstLastNameIsTheFirstInAlfabet = mentor < mentee ? "The mentor's name is the first in alfabet" : "The mentee's name is the first in alfabet"
print(whichFirstLastNameIsTheFirstInAlfabet)

/*
 3. Сколько дней в месяце?
 
 На основе месяца (String, название месяца в нижней регистре) и года (Int), нужно вычислить количество дней в месяце. Если номер года кратен 4, то год является високосным и «февраль» имеет 29 дней. Исключения: если номер года кратен 100, он не является високосным. Исключение из исключения: если номер года кратен 400, год является високосным 😬
 */

// Создаем перечисление с месяцами
enum months {
    case january
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
}

// Создаем функцию, которая примает в качестве входных параметров месяц и год
func daysInMonth(year: Int, month: months) -> Int {
    var daysInMonth: Int = 0
    switch month {
    case .january, .march, .may, .july, .august, .october, .december:
        daysInMonth = 31
    case .april, .june, .september, .november:
        daysInMonth = 30
    case .february:
        if (year % 400 == 0) {
            daysInMonth = 29
        } else if (year % 100 == 0){
            daysInMonth = 28
        } else if (year % 4 == 0) {
            daysInMonth = 29
        } else {
            daysInMonth = 28
        }
    }
    return daysInMonth
}
daysInMonth(year: 2032, month: .april)
daysInMonth(year: 2100, month: .february)

// Вторая реализация задачи
func daysInMonth2(year: Int, month: months) -> Int {
    var daysInMonth: Int = 0
    switch month {
    case .january, .march, .may, .july, .august, .october, .december:
        daysInMonth = 31
    case .april, .june, .september, .november:
        daysInMonth = 30
    case .february where year % 400 == 0:
        daysInMonth = 29
    case.february where year % 100 == 0:
        daysInMonth = 28
    case .february where year % 4 == 0:
        daysInMonth = 29
    case .february:
        daysInMonth = 28
    }
    return daysInMonth
}

// Проверяем все условия
daysInMonth2(year: 3189, month: .december) // месяц декабрь
daysInMonth2(year: 3200, month: .april) // месяц апрель
daysInMonth2(year: 3200, month: .february) // месяц февраль и год кратный 400 високосный
daysInMonth2(year: 3100, month: .february) // месяц февраль и год кратный 100 не високосный
daysInMonth2(year: 3180, month: .february) // месяц февраль и год кратный 4 високосный
daysInMonth2(year: 2021, month: .february) // месяй февраль и год не кратный 4 не високосный

// 4. Зная число, определить следующую степень двойки, большую или равную этому числу.

// Решение подглядел в интернете
func findPowerOfTwo(number: Int) -> Int {
    var power: Int = 1
    var twoInPower = 2
    while twoInPower < number {
        twoInPower *= 2
        power += 1
        print(twoInPower) // это для проверки работоспособности цикла
    }
    return power
}

// Проверяем все условия
findPowerOfTwo(number: 0) // следующая двойка в степени 1
findPowerOfTwo(number: 2) // сама двойка в степени 1
findPowerOfTwo(number: 3) // сама двойка в степени 2
findPowerOfTwo(number: 4) // 4 - это двойка в степени 2
findPowerOfTwo(number: 25) // следующая двойка в степени 5

// 5. Зная число, вычислить треугольное число глубиной, равной этому числу.

// Решение инткуитивно-спонтанное :-)
func findTriangleNumber (number: Int) -> Int {
    var triangleNumber: Int = 0
    var counter = 1
    while counter <= number {
        triangleNumber += counter
        counter += 1
    }
    return triangleNumber
}

findTriangleNumber(number: 7)

// Второе решение по формуле из Вики

func findTriangleNumber2 (number n: Int) -> Int {
    let triangleNumber: Int = (n * (n + 1)) / 2
    return triangleNumber
}

findTriangleNumber2(number: 1)

// 6. Вычислить n-ое число последовательности Фибоначчи.

// Solution with recursion function
func findFibonachi (number: Int) -> Int {
    var fibonachiNumber: Int = 0
    if number == 0 {
        fibonachiNumber = 0
    } else if number == 1 {
        fibonachiNumber = 1
    }
    else {
        fibonachiNumber = ((findFibonachi(number: number - 1)) + findFibonachi(number: number - 2))
    }
    return fibonachiNumber
}
findFibonachi(number: 10)

// Solution with for-loop
func findFibonachi2 (number: Int) -> Int {
    var array: [Int] = []
    for n in 0...number {
        if n == 0 {
            array.append(n)
        } else if n == 1 {
            array.append(n)
        }
        else {
            array.append(array[n - 1] + array[n - 2])
        }
    }
    return array[number]
}
findFibonachi2(number: 10)


// 7. Распечатать таблицу, показывающую количество комбинаций для создания каждого числа от 2 до 12 при 2 бросках шестигранных игральных костей.

func diceRollTable() {
    var combinationArray: [[[Int]]] = []
    let diceRoll1 = [1, 2, 3, 4, 5, 6]
    let diceRoll2 = [1, 2, 3, 4, 5, 6]
    for i in diceRoll1 {
        for j in diceRoll2 {
            if i + j == 2 {
                if combinationArray.count == 0{
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[0].append([i, j])
                }
            } else if i + j == 3 {
                if  combinationArray.count == 1 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[1].append([i, j])
                }
            } else if i + j == 4 {
                if combinationArray.count == 2 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[2].append([i, j])
                }
            } else if i + j == 5 {
                if combinationArray.count == 3 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[3].append([i, j])
                }
            } else if i + j == 6 {
                if combinationArray.count == 4 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[4].append([i, j])
                }
            } else if i + j == 7 {
                if combinationArray.count == 5 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[5].append([i, j])
                }
            } else if i + j == 8 {
                if combinationArray.count == 6 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[6].append([i, j])
                }
            } else if i + j == 9 {
                if combinationArray.count == 7 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[7].append([i, j])
                }
            } else if i + j == 10 {
                if combinationArray.count == 8 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[8].append([i, j])
                }
            } else if i + j == 11 {
                if combinationArray.count == 9 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[9].append([i, j])
                }
            } else if i + j == 12 {
                if combinationArray.count == 10 {
                    combinationArray.append([[i, j]])
                } else {
                    combinationArray[10].append([i, j])
                }
            }
        }
    }
    print(combinationArray[0])
    print(combinationArray[1])
    print(combinationArray[2])
    print(combinationArray[3])
    print(combinationArray[4])
    print(combinationArray[5])
    print(combinationArray[6])
    print(combinationArray[7])
    print(combinationArray[8])
    print(combinationArray[9])
    print(combinationArray[10])
}
diceRollTable()

