import Foundation

struct Hero {
    let numberOfGifts: Int
    let arrayOfPower: [Int]
    
    func unnessesaryGift() -> Int {
        let unnessGift: Int
//        let indexOfUnnessGift: Int
        let negative = arrayOfPower.filter { $0 < 0 }
        
        if negative.count == 0 {
            unnessGift = arrayOfPower.min()!
        } else if negative.count % 2 == 0 {
            unnessGift = negative.min()!
        } else {
            unnessGift = negative.max()!
        }
        return unnessGift
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        let hero = reader.read()
        let result = hero.unnessesaryGift()
        print(result)
    }
        
    // MARK: - Private

    private class DataReader {
        
        func read() -> Hero {
//            print("Введите количество вещей:")
            let firstString = readLine() ?? ""
            let numberOfGifts = Int(firstString) ?? 0
//            print("Введите боевые потенциалы вещей:")
            let secondString = readLine() ?? ""
            let arrayOfPower = secondString.split(separator: " ").map(String.init).compactMap(Int.init)
            
//            if numberOfGifts != arrayOfPower.count {
//                fatalError("Вы ввели неверные данные!")
//            }
            
            let hero = Hero(numberOfGifts: numberOfGifts, arrayOfPower: arrayOfPower)
            
            return hero
        }
    }
}

let application = Application()
application.main()
