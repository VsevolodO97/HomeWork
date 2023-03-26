//
//  main.swift
//  BoredNumbers
//
//  Created by Alexander Kurbatov on 20.03.2023.
//

import Foundation

struct EnterData {
    
    let numberOfNumbers: Int
    let arrayOfNumbers: [Int]
 
    var result: Int
    
    mutating func checkLenth() -> Int {
        
        var count = [Int](repeating: 0, count: 200001) // массив, в котором хранится количество вхождений каждого числа
        var distinct = 0 // количество различных чисел

        for j in 0..<numberOfNumbers {
            let i = arrayOfNumbers[j]
            count[i] += 1
            if count[i] == 1 {
                distinct += 1
            } else if count[i] > 2 {
                distinct -= 1
            }

         
        }

      
        
        return  result
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.checkLenth()
//        print("Рузультат:")
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
//            print("Введите размер массива:")
            let firstString = readLine() ?? ""
            let numberOfNumbers = Int(firstString) ?? 0
//              print("Введите массив чисел:")
            let secondString = readLine() ?? ""
            let arrayOfNumbers = secondString.split(separator: " ").map{ Int($0)! }
            
//            if numberOfReviews < 0 || numberOfSeniors < numberOfReviews || numberOfJuniors < numberOfSeniors {
//                fatalError("Вы ввели неверные данные!")
//            }
            
            
            let enterData = EnterData(numberOfNumbers: numberOfNumbers, arrayOfNumbers: arrayOfNumbers, result: 0)
            
            return enterData
        }
    }
}

let application = Application()
application.main()




