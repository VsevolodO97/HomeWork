import Foundation

struct EnterData {
    
    let numberOfLetters: Int
    let arrayOfLetters: [Character]
    let arrayOfTimes: [UInt]
    
    func findDifficultLetter() -> Character {
        
        var arrayOfAbsolutTimes: [UInt] = []
        
        for i in 0..<arrayOfTimes.count {
            var time: UInt = 0
            
            if i == 0 {
                time = arrayOfTimes[0]
            } else {
                time = arrayOfTimes[i] - arrayOfTimes[i - 1]
            }
            arrayOfAbsolutTimes.append(time)
        }
        
        let maxTime = arrayOfAbsolutTimes.max()!
        var leadersIndexes: [Int] = []
        for i in 0..<arrayOfAbsolutTimes.count {
            if arrayOfAbsolutTimes[i] == maxTime {
                leadersIndexes.append(i)
            }
        }
       
//        let maxTimeIndex = arrayOfAbsolutTimes.firstIndex(of: maxTime)!
        let difficultLetter = arrayOfLetters[leadersIndexes.last!]
        
        return  difficultLetter
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        let enterData = reader.read()
        let result = enterData.findDifficultLetter()
        print(result)
    }
        
    // MARK: - Private

    private class DataReader {
        
       
        
        func read() -> EnterData {
            print("Введите количество введённых букв:")
            let firstString = readLine() ?? ""
            let numberOfLetters = Int(firstString) ?? 0
            print("Введите введённую строку:")
            let secondString = readLine() ?? ""
            let arrayOfLetters = secondString.compactMap(Character.init)
            print("Введите время ввода каждой буквы:")
            let thirdString = readLine() ?? ""
            let arrayOfTimes = thirdString.split(separator: " ").map(String.init).compactMap(UInt.init)
            
            if numberOfLetters != arrayOfLetters.count || numberOfLetters != arrayOfTimes.count {
                fatalError("Вы ввели неверные данные!")
            }
            
            let enterData = EnterData(numberOfLetters: numberOfLetters, arrayOfLetters: arrayOfLetters, arrayOfTimes: arrayOfTimes)
            
            return enterData
        }
    }
}

let application = Application()
application.main()
