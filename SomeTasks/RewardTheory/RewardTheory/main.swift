import Foundation

struct Head {
    
    let parent: Int
    let grade: Int
    let reward: Int?
    
    func countRewards() -> String {
        
        return "Результат"
    }
    
}


final class Application {
    
    func main() {
        let reader = DataReader()
        let heads = reader.read()
        let result = heads
        print(result)
    }
    

    
    // MARK: - Private

    private class DataReader {
        
        func read() -> [Head] {
            print("Введите количество отделов в компании и сумму премирования: ")
            let firstString = readLine() ?? ""
            print("Введите оценки эффективности отделов: ")
            let secondString = readLine() ?? ""
            print("Введите указатели подчинённости отделов: ")
            let thirdString = readLine() ?? ""
            
            let numberOfHeadsAndSummArray = firstString.map { Int(String($0))! }
            let gradesArray = secondString.map { Int(String($0))! }
            let parentsArray = thirdString.map { Int(String($0))! }
            let numberOfHeads = numberOfHeadsAndSummArray[0]
            let summ = numberOfHeadsAndSummArray[1]
            
            var arrayOfHeads: [Head] = []
            
            for i in 0..<numberOfHeads {
                arrayOfHeads.append(Head(parent: parentsArray[i], grade: gradesArray[i], reward: nil))
            }
            
//            let students = Students(
//                groop1: groop1,
//                groop2: groop2
//            )
            
            return arrayOfHeads
        }
    }
}

let application = Application()
application.main()
