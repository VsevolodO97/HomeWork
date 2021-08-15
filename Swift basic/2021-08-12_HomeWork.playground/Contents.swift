import UIKit

/*
 1. Дочитать нотацию Big-O
 https://www.geeksforgeeks.org/difference-between-big-oh-big-omega-and-big-theta/

 2. Реализовать быструю сортировку на Swift

 3. Изучить сложность основных операций в массиве Array

 - append
 - remove(at:)
 - removeLast
 - removeFirst
 - insert(_ at:)
 - contains
 - first
 - last
 - доступ по индексу (subscript)
 - sort

 4. Реализовать функцию, удаляющую из массива первое вхождение переданного числа

 func removingOnce(_ item: Int, from array: [Int]) -> [Int]

 5. Написать функцию, которая удаляет все вхождения числа из массива

 func removing(_ item: Int, from array: [Int]) -> [Int]

 6. Реализовать самостоятельно функцию reversed для массива

 func reversed(_ array: [Int]) -> [Int]
 */


//  2. Реализовать быструю сортировку на Swift

func quickSort(array: [Int]) -> [Int] {
    var pivot = 0
    var less: [Int] = []
    var greater: [Int] = []
    var equalPivot: [Int] = []
    if array.count < 2 || array.isEmpty {
        return array
    } else {
        pivot = array[Int.random(in: 0...(array.count - 1))]
        //  pivot = array[array.count / 2]
        for i in array {
            if i < pivot {
                less.append(i)
            } else if i > pivot {
                greater.append(i)
            } else if i == pivot {
                equalPivot.append(i)
            }
        }
    }
    return quickSort(array: less) + equalPivot + quickSort(array: greater)
}
quickSort(array: [9, 9, 5, 1, 6, 0, 0, 7, 0])
quickSort(array: [2, 1])
quickSort(array: [])

/*
 3. Изучить сложность основных операций в массиве Array

 - append
 Complexity: O(1) - доступ к одному элементу(добавляем один элемент в конец массива)
 
 - remove(at:)
 Complexity: O(n) - доступ к одному элементу массива, его удаление и потом смещение элементов массива (индекс которых больше индекса удаленного элемента)
 
 - removeLast
 log n(удаляем один элемент из конец массива)
 
 - removeFirst
 Complexity: O(n) - добавляем первый элемент массива и потом смещаем весь массив вправо на 1 индекс
 
 - insert(_ at:)
 Complexity: O(n) - добавляется один элемент массива и потом и потом смещение элементов массива (индекс которых больше индекса добавленного элемента)
 
 - contains
 Complexity: O(n) - потому что происходит перебор элементов массива и сравнение и искомым элементом
 
 - first
 Complexity: O(1) - доступ к первому элементу массива
 
 - last
 Complexity: O(1) - доступ к последнему элементу массива
 
 - доступ по индексу (subscript)
 Complexity: O(1) - доступ к одному элементу по индексу

 - sort
 Complexity: O(n log n) - алгоритмы сортировок(например быстрой сортировки или сортировки слиянием) имеют сложность O(n log n), так как количество операций над массивом составляет log n, а количество проходов по массиву n
 */

/*
 4. Реализовать функцию, удаляющую из массива первое вхождение переданного числа

 func removingOnce(_ item: Int, from array: [Int]) -> [Int]
 */
func removingOnce(_ item: Int, from array: [Int]) -> [Int] {
    var tempArr: [Int] = array
    for (index, element) in tempArr.enumerated() {
        if element == item {
            tempArr.remove(at: index)
            break
        }
    }
    return tempArr
}

print(removingOnce(2, from: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2]))

/*
 5. Написать функцию, которая удаляет все вхождения числа из массива

 func removing(_ item: Int, from array: [Int]) -> [Int]
 */

func removing(_ item: Int, from array: [Int]) -> [Int] {
    var tempArr: [Int] = []
    for element in array {
        if element != item {
            tempArr.append(element)
        }
    }
    return tempArr
}

print(removing(2, from: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2]))

/*
 6. Реализовать самостоятельно функцию reversed для массива
 func reversed(_ array: [Int]) -> [Int]
 */

func reversed(_ array: [Int]) -> [Int] {
    var tempArr: [Int] = []
    for index in stride(from: array.count - 1, through: 0, by: -1) {
    tempArr.append(array[index])
    }
    return tempArr
}

print(reversed([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 2]))
