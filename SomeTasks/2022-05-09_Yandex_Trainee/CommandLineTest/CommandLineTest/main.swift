import Foundation

struct Student: Equatable {
    
    let name1: String // Петр | Иванов
    let name2: String // Иванов | Петр
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name1 == rhs.name1 && lhs.name2 == rhs.name2 ||
        lhs.name1 == rhs.name2 && lhs.name2 == rhs.name1
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        let flight = reader.read()
        let result = flight.findDiff()
        print(result)
    }
    
    func main2() {
        set1 = readline = array1 + array2
        let student1 = Student(name1: array1[0], name2: array1[1])
        let student2 = Student(name1: array2[0], name2: array2[1])
        
        let set1 = Set([student1, student2])
        let set2 = Set([student1, student2])
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
            
            let result = "\(diff / 60):\(diff % 60)"
            
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
