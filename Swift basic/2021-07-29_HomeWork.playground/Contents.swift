import UIKit

// 1. Реализовать задачу по нахождению элемента последовательности Фибоначчи через цикл for
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

/*
 2. Сделать 7-ю задачу из предыдущей домашки
 Распечатать таблицу, показывающую количество комбинаций для создания каждого числа от 2 до 12 при 2 бросках шестигранных игральных костей.
 */

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

// 3. Распечатать (print) числа от 10 до 0 (использовать функцию reversed() массива нельзя

func sortArrayOf(members: Int) {
    var array: [Int] = []
    for i in 0...members {
        array.insert(i, at: 0)
    }
    print(array)
}

sortArrayOf(members: 10)
