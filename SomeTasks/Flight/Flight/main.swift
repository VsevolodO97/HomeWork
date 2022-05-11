import Foundation

final class Application {
    
    func main() {
        let reader = DataReader()
        let flight = reader.read()
        let result = flight.findDiff()
        print(result)
    }
    
    // MARK: - Private
    
    private struct Flight {
        
        private static let separator: Character = ":"
        
        let sourceTime: String
        let destinationTime: String
        let timeZoneDiff: String
        
        func findDiff() -> String {
            let sourceTimeArray = sourceTime.split(separator: Flight.separator).map(String.init).map(Int.init)
            let destinationTimeArray = destinationTime.split(separator: Flight.separator).map(String.init).map(Int.init)
            let timeZoneDiffInt = Int(timeZoneDiff) ?? 0
            
            let source = sourceTimeArray[0]! * 60 + sourceTimeArray[1]!
            let destination = destinationTimeArray[0]! * 60 + destinationTimeArray[1]!
            let timeZone = timeZoneDiffInt * 60
            
            let diff = destination - (source + timeZone)
            
//           12: let result = "\(diff / 60):\(diff % 60)"
            let result = "\(diff / 60):\(String(format: "%02d", (diff % 60)))"
            return result
        }
    }

    private class DataReader {
        
        func read() -> Flight {
            print("Введите время отправления: ")
            let source = readLine() ?? ""
            print("Введите время прибытия: ")
            let destination = readLine() ?? ""
            print("Введите разницу в часовых поясах: ")
            let timeZoneDiff = readLine() ?? ""
            
            let flight = Flight(
                sourceTime: source,
                destinationTime: destination,
                timeZoneDiff: timeZoneDiff
            )
            
            return flight
        }
    }
}

let application = Application()
application.main()
