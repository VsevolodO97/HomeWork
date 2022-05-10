import UIKit

class Application {
    
    func main() {
        let input: String = "readLine()!"
        let finder = HappyTicketFinder(input: input)
        let result = finder.getNearestHappyNumber()
        print(result)
    }
    
    private class HappyTicketFinder {
        
        private let input: String
        
        // MARK: - Initialization
        
        init(input: String) {
            self.input = input
        }
        
        // MARK: - Public
        
        func getNearestHappyNumber() -> String {
            "Happy number"
        }
        
        // MARK: - Private
        
        private func mapInputToInts() -> [Int] {
            let number = Int(input)
            return [1, 2, 3]
        }
        
        private func checkIfHappy(_ input: String) -> Bool {
            false
        }
        
        private func findNextHappy(_ input: String) -> String {
            ""
        }
    }

}

let app = Application()
app.main()


let input = "12345"
let number = input.map { Int(String($0))! }
print(number)
