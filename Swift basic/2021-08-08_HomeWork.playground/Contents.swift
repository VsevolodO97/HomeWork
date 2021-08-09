import UIKit

/*
 1. Разобраться с типами данных и описать интерфейс каждого из них на Swift

 - массив
 - односвязный список
 - двусвязный список
 - стек
 - очередь
 - хэш-таблица

 */

struct ArrayInterface {
    let array = Array(1...1000)
    
    // Функция, проверяющая пустой массив или нет
    func isEmpty(array: [Int]) -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
    
    // Функция, которая считает количество элементов в массиве
    func count(array: [Int]) -> Int {
        var count = 0
        for _ in array {
            count += 1
        }
        return count
    }
    
    // Функция доступа к элементу массива по индеку
    func index(array: [Int], index: Int) -> Int? {
        var element: Int = 0
        for i in array {
            if i == index {
                element = array[i]
            } else {
                return nil
            }
        }
        return element
    }
    
    // Функция доступа к первому элементу
    func first(array: [Int]) -> Int? {
       return array[0]
    }
    
    // Функция доступа к последнему элементу
    func last(array: [Int]) -> Int? {
        return array[array.count - 1]
     }
    
    // Функция, добавляющая элемент в конец массива
    func append(array: [Int], element: Int) -> [Int] {
        let tempArr = [element]
        return array + tempArr
    }
    
    // Функция, вставляющая элемент по индексу массива
    func insertAt(array: [Int], element: Int, index: Int) -> [Int] {
        return []
    }
    
    // Функция, удаляющая элемент по индексу
    func removeAt(array: [Int], element: Int, index: Int) -> [Int] {
        return []
    }
    
}

struct Stack {
    let array = Array(1...1000)

}

