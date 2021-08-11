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

// Интерфейс массива
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

// Интерфейс односвязного списка

struct SinglyLinkedList {
    let array = Array(1...1000)
    var element: (data: Int, next: Int)
    
    func insertAtEnd(array: [Int], element: Int) -> [Int] {
        let tempArr = [element]
        return array + tempArr
    }
    
    func insertAtHead(array: [Int], element: Int) -> [Int] {
        return []
    }
    
    func delete(array: [Int]) -> [Int] {
        return []
    }
    
    func deleteAtHead(array: [Int]) -> [Int] {
        return []
    }
    
    func search(array: [Int], element: Int) -> Int {
        return 0
    }
    
    func isEmpty(array: [Int]) -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
    
}

// Интерфейс двусвязного списка

struct DoublyLinkedList {
    let array = Array(1...1000)
    var element: (previous: Int, data: Int, next: Int)
    
    func insertAtEnd(array: [Int], element: Int) -> [Int] {
        let tempArr = [element]
        return array + tempArr
    }
    
    func insertAtHead(array: [Int], element: Int) -> [Int] {
        return []
    }
    
    func delete(array: [Int]) -> [Int] {
        return []
    }
    
    func deleteAtHead(array: [Int]) -> [Int] {
        return []
    }
    
    func search(array: [Int], element: Int) -> Int {
        return 0
    }
    
    func isEmpty(array: [Int]) -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
    
}

// Интерфейс стека

struct Stack {
    let array = Array(1...1000)
    
    func push(array: [Int], element: Int) -> [Int] {
        let tempArr = [element]
        return array + tempArr
    }
    
    func pop(array: inout [Int]) -> Int {
        var tempArr: [Int] = []
        let lastElement = array[array.count - 1]
        for i in array where i < array.count - 2 {
            tempArr.append(array[i])
        }
        array = tempArr
        return lastElement
    }
    
    func top(array: [Int]) -> Int {
        return array[array.count - 1]
    }
    
    func isEmpty(array: [Int]) -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
}

// Интерфейс очереди

struct Queue {
    let array = Array(1...1000)
    
    func enqueue(array: [Int], element: Int) -> [Int] {
        let tempArr = [element]
        return array + tempArr
    }
    
    func dequeue(array: inout [Int]) -> Int {
        var tempArr: [Int] = []
        let firstElement = array[0]
        for i in array where i > 0 {
            tempArr.append(array[i])
        }
        array = tempArr
        return firstElement
    }
    
    func top(array: [Int]) -> Int {
        return array[0]
    }
    
    func isEmpty(array: [Int]) -> Bool {
        if array.count == 0 {
            return true
        } else {
            return false
        }
    }
}

// Интерфейс хэш-таблицы

struct HashTable {
    let array = Array(1...1000)
    
    // Функция, проверяющая пустой  словарь или нет
    func isEmpty() -> Bool {return true}
    
    // Функция, которая считает количество элементов в словаре
    func count() -> Int {
        let count = 0
        return count
    }
    
    // Функция доступа к элементу массива по ключу
    func keyValue(dict: [String: Int], key: String) -> Int? {
        let element: Int = 0
        return element
    }
}


/*
 3. Реализовать на Swift сортировку пузырьком
 */

func bubleSort(array: [Int]) -> [Int] {
    var array = array
    for i in stride(from: array.count - 1, through: 0, by: -1) {
        for j in 0..<i {
            if array[j] > array[j + 1] {
                let tempArray = array[j + 1]
                array[j + 1] = array[j]
                array[j] = tempArray
            }
        }
        print(array)
    }
    return array
}
bubleSort(array: [6, 5, 4, 3, 2, 1, 0])
