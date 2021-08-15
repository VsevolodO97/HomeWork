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
