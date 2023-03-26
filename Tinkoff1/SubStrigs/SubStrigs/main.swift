//
//  main.swift
//  SubStrigs
//
//  Created by Alexander Kurbatov on 20.03.2023.
//

import Foundation

struct EnterData {
    
    let numberOfChar: Int
    let arrayOfString: [String]

    var result: Int
    
    mutating func findLenth() -> Int {
        
        var countA = 0, countB = 0, countC = 0, countD = 0
        var answer = Int.max

        for i in 0..<numberOfChar {
            if arrayOfString[i] == "a" {
                countA = i + 1
            } else if arrayOfString[i] == "b" {
                countB = i + 1
            } else if arrayOfString[i] == "c" {
                countC = i + 1
            } else {
                countD = i + 1
            }

            if countA > 0 && countB > 0 && countC > 0 && countD > 0 {
                let minIndex = min(countA, countB, countC, countD)
                let maxIndex = max(countA, countB, countC, countD)
                answer = min(answer, (maxIndex - 1) - (minIndex - 1) + 1)
            }
        }

        if answer == Int.max {
            result = -1
        } else {
            result = answer
        }
        
        return  result
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.findLenth()
//        print("Рузультат:")
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
//            print("Введите количество букв:")
            let firstString = readLine() ?? ""
            let numberOfChar = Int(firstString) ?? 0
//            print("Введите строку:")
            let secondString = readLine() ?? ""
            let arrayOfString = secondString.map { String($0) }

            
            
            if numberOfChar != arrayOfString.count {
                fatalError("Вы ввели неверные данные!")
            }
            
            let enterData = EnterData(numberOfChar: numberOfChar, arrayOfString: arrayOfString, result: 0)
            
            return enterData
        }
    }
}

let application = Application()
application.main()



