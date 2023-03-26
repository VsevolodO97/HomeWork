//
//  main.swift
//  SnowMan
//
//  Created by Alexander Kurbatov on 11.02.2023.
//

import Foundation

final class Application {
    
    func main() {
        let reader = DataReader()
        var snowMan = reader.read()
        let result = snowMan.countDays()
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        func read() -> SnowMan {
            print("Введите количество дней:")
            let firstString = readLine() ?? ""
            let numberOfDays = Int(firstString) ?? 0
            
            print("Введите размеры шаров:")
            let balls = readLine() ?? ""
            var arrayOfBalls = balls.compactMap{ Int(String($0)) }
//            print(arrayOfBalls)
            let snowMan = SnowMan(numberOfDays: numberOfDays, arrayOfBalls: arrayOfBalls)
            return snowMan
            
        }
    }
    
    private struct SnowMan {
        let numberOfDays: Int
        var arrayOfBalls: [Int]
        
        
        var ballOfADay = 0
        var maxInt = 0
        var arrToPrint: [Int] = []
        var arrToPrint1: [Int] = []
        mutating func countDays() {
            
            for i in 0..<arrayOfBalls.count {
                ballOfADay = numberOfDays - i
                maxInt = numberOfDays
                if arrayOfBalls[i] == ballOfADay {
                    arrToPrint.append(arrayOfBalls[i])
                    maxInt = ballOfADay - 1
             
                    if i == arrayOfBalls.count - 1 {
                        print(arrToPrint)
                    }
                } else if arrayOfBalls[i] == maxInt {
                    print(arrToPrint1)
                    arrToPrint1 = []
                    
                } else {
                    print(arrToPrint)
                    arrToPrint = []
                    arrToPrint1.append(arrayOfBalls[i])
                }
                
                
                ballOfADay -= 1
            }
        }
        
    }
}

let application = Application()
application.main()
