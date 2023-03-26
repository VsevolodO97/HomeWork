//
//  main.swift
//  Queue
//
//  Created by Alexander Kurbatov on 20.03.2023.
//

import Foundation


struct EnterData {
    
    let fitstHeight: Int16
    let secondHeight: Int16
    let thirdHeight: Int16
    let fourthHeight: Int16
    var result: String
    
    mutating func checkOdered() -> String {
        
        if fitstHeight >= secondHeight && secondHeight >= thirdHeight && thirdHeight >= fourthHeight {
            result = "YES"
        } else if fitstHeight <= secondHeight && secondHeight <= thirdHeight && thirdHeight <= fourthHeight {
            result = "YES"
        } else {
            result = "NO"
        }
        
        return  result
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.checkOdered()
//        print("Рузультат:")
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
//            print("Введите рост первого человека:")
            let firstString = readLine() ?? ""
            let fitstHeight = Int16(firstString) ?? 0
//            print("Введите рост второго человека:")
            let secondString = readLine() ?? ""
            let secondHeight = Int16(secondString) ?? 0
//            print("Введите рост третьего человека:")
            let thirdString = readLine() ?? ""
            let thirdHeight = Int16(thirdString) ?? 0
//            print("Введите рост четертого человека:")
            let fourthString = readLine() ?? ""
            let fourthHeight = Int16(fourthString) ?? 0
            
            
            if fitstHeight < 0 || fitstHeight > 300 || secondHeight < 0 || secondHeight > 300 || thirdHeight < 0 || thirdHeight > 300 || fourthHeight < 0 || fourthHeight > 300 {
                fatalError("Вы ввели неверные данные!")
            }
            
            let enterData = EnterData(fitstHeight: fitstHeight, secondHeight: secondHeight, thirdHeight: thirdHeight, fourthHeight: fourthHeight, result: "")
            
            return enterData
        }
    }
}

let application = Application()
application.main()



