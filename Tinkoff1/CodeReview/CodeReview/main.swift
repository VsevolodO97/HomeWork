//
//  main.swift
//  CodeReview
//
//  Created by Alexander Kurbatov on 20.03.2023.
//

import Foundation

struct EnterData {
    
    let numberOfJuniors: Int
    let numberOfSeniors: Int
    let numberOfReviews: Int
    var duration: Int
    
    mutating func checkDuration() -> Int {
        
        let totalReviews = (numberOfJuniors * numberOfReviews)
        if totalReviews % numberOfSeniors != 0 {
            duration = totalReviews / numberOfSeniors + 1
        } else {
            duration = totalReviews / numberOfSeniors
        }
        
        return  duration
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var enterData = reader.read()
        let result = enterData.checkDuration()
//        print("Рузультат:")
        print(result)
    }
    
    // MARK: - Private
    
    private class DataReader {
        
        
        
        func read() -> EnterData {
//            print("Введите данные:")
            let firstString = readLine() ?? ""

            let dataArray = firstString.split(separator: " ").map{ Int($0)! }
            let numberOfJuniors = dataArray[0]
            let numberOfSeniors = dataArray[1]
            let numberOfReviews = dataArray[2]
            
            if numberOfReviews < 0 || numberOfSeniors < numberOfReviews || numberOfJuniors < numberOfSeniors {
                fatalError("Вы ввели неверные данные!")
            }
            
            
            let enterData = EnterData(numberOfJuniors: numberOfJuniors, numberOfSeniors: numberOfSeniors, numberOfReviews: numberOfReviews, duration: 0)
            
            return enterData
        }
    }
}

let application = Application()
application.main()



