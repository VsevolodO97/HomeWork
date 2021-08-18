import UIKit

/*
 1. Разобраться со сложностью операций для словаря

 - доступ к элементам по ключу
 - вставка новой пары ключ-значение
 - удаление элемента

 2. По операциям для множества

 - поиск (contains)
 - добавление
 - удаление
 - intersect
 - isSubset

 3. Составить словарь с двухбуквенными кодами стран в качестве ключей и полными именами в качестве значений. Напишите функцию, которая печатает все страны с названиям, длина которых превышает восемь символов

 4. Написать функцию, объединяющую два словаря в один. Если определенный ключ присутствует в обоих словарях, игнорировать пару из первого словаря.


 func merging(_ dict1: [String: String], with dict2: [String: String]) -> [String: String]


 5. Написать функцию instancesOfCharacters, которая вычисляет, какие символы встречаются в строке, а также как часто встречается каждый из этих символов. Вернуть результат в виде словаря.


 func occurrencesOfCharacters(in text: String) -> [Character: Int]


 6. Написать функцию, которая возвращает true, если все значения словаря уникальны. Использовать Set для проверки уникальности

 7. Создать словарь averageRatings, который будет содержать сопоставление названий приложений со оценками в AppStore. Bcgjkmpjdfnm forEach для итерации по словарю appRatings, а затем использовать reduce, чтобы вычислить средний рейтинг. Сохранить этот рейтинг в словаре averageRatings. После использовать объединенные вместе filter и map, чтобы получить список названий приложений, средний рейтинг которых превышает 3

 ```
 let appRatings = [
   "GetContact": [5, 5, 5, 4, 2, 1, 5, 4],
   "Messenger": [4, 3, 2, 5, 4, 5, 1, 2],
   "CocoaHeads": [2, 1, 3, 2, 1, 2, 1, 1]
 ]
 ```
 */

/*
 1. Разобраться со сложностью операций для словаря

 - доступ к элементам по ключу
 Complexity: O(1)
 
 - вставка новой пары ключ-значение
 Complexity: O(1)
 
 - удаление элемента
 Complexity: O(n) - не понял почему. Ведь доступ к элементу происходит по хэш, который "привязан" к индексу массива
 
 */

/*
 2. По операциям для множества

 - поиск (contains)
 Complexity: O(1)
 
 - добавление
 Complexity: O(1)
 
 - удаление
 Complexity: O(1)
 
 - intersect
 Complexity: O(n^2)
 
 - isSubset
 Complexity: O(n^2)
 
 */


/*
 3. Составить словарь с двухбуквенными кодами стран в качестве ключей и полными именами в качестве значений. Напишите функцию, которая печатает все страны с названиям, длина которых превышает восемь символов
 */

let countryDict = ["RU": "RF", "US": "USA", "NP": "Nepal", "NZ": "New Zeland", "TR": "Turkey"]

func printCountries(countries: [String: String]) {
    for (index, country) in countries {
        if country.count > 8 {
            print("\(index): \(country)")
        }
    }
}

printCountries(countries: countryDict)

/*
 4. Написать функцию, объединяющую два словаря в один. Если определенный ключ присутствует в обоих словарях, игнорировать пару из первого словаря.
 */

let countryDict1  = ["RU": "Russian Federation", "US": "United States of America", "NP": "Nepal", "NZ": "New Zeland", "TH": "Thailand"]

func merging(dict1: [String: String], dict2: [String: String]) -> [String: String] {
    var finalDict: [String: String] = [:]
    let unionSetOfCounties = Set(dict1.keys).union(Set(dict2.keys))
   // print(unionSetOfCounties)
    for country in unionSetOfCounties {
        if let _ = countryDict1[country] {
        finalDict[country] = countryDict1[country]
        } else {
            finalDict[country] = countryDict[country]
        }
    }
    return finalDict
}

print(merging(dict1: countryDict, dict2: countryDict1))

// Решение на встроенном методе
let finalDict = countryDict.merging(countryDict1) { (_, new) in new }
print(finalDict)


/*
 5. Написать функцию instancesOfCharacters, которая вычисляет, какие символы встречаются в строке, а также как часто встречается каждый из этих символов. Вернуть результат в виде словаря.
 */

func occurrencesOfCharacters(in text: String) -> [Character: Int] {
    var dict: [Character: Int] = [:]
    for charachter in text {
        if charachter != " " {
        let countChar = (text.filter {$0 == charachter}).count
        dict[Character(charachter.uppercased())] = countChar
        }
    }
    return dict
}

print(occurrencesOfCharacters(in: "Hello world!"))
