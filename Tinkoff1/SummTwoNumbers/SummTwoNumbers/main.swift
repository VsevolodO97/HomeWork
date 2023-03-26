//
//  main.swift
//  SummTwoNumbers
//
//  Created by Alexander Kurbatov on 17.03.2023.
//

import Foundation

struct EnterData {
    
    let fitstNumber: Int16
    let secondNumber: Int16
    var summOfNumbers: Int16
    
    mutating func findSummOfNumbers() -> Int16 {
        
        summOfNumbers = fitstNumber + secondNumber
        
        return  summOfNumbers
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.findSummOfNumbers()
//        print("Сумма двух чисел:")
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
//                        print("Введите первое число:")
            let firstString = readLine() ?? ""
            let fitstNumber = Int16(firstString) ?? 0
//                        print("Введите второе число:")
            let secondString = readLine() ?? ""
            let secondNumber = Int16(secondString) ?? 0
            
            
            if fitstNumber < -32000 || fitstNumber > 32000 || secondNumber < -32000 || secondNumber > 32000 {
                fatalError("Вы ввели неверные данные!")
            }
            
            let enterData = EnterData(fitstNumber: fitstNumber, secondNumber: secondNumber, summOfNumbers: 0)
            
            return enterData
        }
    }
}

let application = Application()
application.main()


