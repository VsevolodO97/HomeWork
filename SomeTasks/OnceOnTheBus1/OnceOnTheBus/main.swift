import Foundation

class Application  {
    
    func main() {
        let input = DataReader().readData()
        let finder = HappyTicketFinder(input: input)
        let result = finder!.getNearestHappyNumber()
        print(result)
    }
    
    
    private class HappyTicketFinder {
        
        private var input: String
        
        // MARK: - Initialization
        
        init?(input: String) {
    
            guard input.count == 6 else {
             print("Номер билета должен содержать 6 цифр!")
              return nil
            }
            
            self.input = input
        }
        
        // MARK: - Public
        
        func getNearestHappyNumber() -> String {
            while checkIfHappy(input) == false {
                input = String(Int(input)! + 1)
            }
 
            return input
        }
        
        // MARK: - Private
        
//        private func mapToInts() -> Int {
//            let ints = Int(input)!
//
//            return ints
//        }
        
        private func checkIfHappy(_ input: String) -> Bool {
            
            let arrayOfNumbers = input.map { Int(String($0))! }
            let firstArray = Array(arrayOfNumbers[0...2])
            let secondArray = Array(arrayOfNumbers[3...5])
            let sumA = firstArray.reduce(0, { x, y in x + y })
            let sumB = secondArray.reduce(0, { x, y in x + y })
            
            if sumA == sumB {
                return true
            } else {
                return false
            }
        }
            
//            private func findNextHappy(_ input: String) -> String {
//                ""
//            }
        }
        
    private class DataReader {
        func readData() -> String {
            print("Введите номер билета: ")
            let ticketNumber = readLine() ?? ""
            return ticketNumber
        }
    }
  
}

let app = Application()
app.main()
