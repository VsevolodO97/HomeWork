import Foundation

struct Students: Equatable {
    
    private static let separator: Character = ","
    
    let groop1: String // Петр | Иванов
    let groop2: String // Иванов | Петр
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.groop1 == rhs.groop1 && lhs.groop2 == rhs.groop2 ||
        lhs.groop1 == rhs.groop2 && lhs.groop2 == rhs.groop1
    }
    
    func findDiff() -> String {
        var groop1Array = groop1.split(separator: Students.separator).map(String.init)
        var groop2Array = groop2.split(separator: Students.separator).map(String.init)
        groop1Array[1].remove(at: groop1Array[1].startIndex)
        groop2Array[1].remove(at: groop2Array[1].startIndex)
        groop1Array[1].removeLast()
        groop2Array[1].removeLast()
//        groop1Array[1].remove(at: groop1Array[1].endIndex)
        
        let arrayOfNamesGroop1Student1 = (groop1Array[0].split(separator: " ").map(String.init))
        let arrayOfNamesGroop1Student2 = (groop1Array[1].split(separator: " ").map(String.init))
       
        let arrayOfNamesGroop2Student1 = (groop2Array[0].split(separator: " ").map(String.init))
        let arrayOfNamesGroop2Student2 = (groop2Array[1].split(separator: " ").map(String.init))
//        let firstGroop = arrayOfNamesGroop1Student1 + arrayOfNamesGroop1Student2
//        let secondGroop = arrayOfNamesGroop2Student1 + arrayOfNamesGroop2Student2
//        let setOfStudents = Set(
//                                [Set(arrayOfNamesGroop1Student1),
//                                 Set(arrayOfNamesGroop1Student2),
//                                 Set(arrayOfNamesGroop2Student1),
//                                 Set(arrayOfNamesGroop2Student2)]
//        )
        var match = 0
        if Set([Set(arrayOfNamesGroop1Student1), Set(arrayOfNamesGroop2Student1)]).count != 2 {
           match += 1
        }
        if Set([Set(arrayOfNamesGroop1Student1), Set(arrayOfNamesGroop2Student2)]).count != 2 {
           match += 1
        }
        if Set([Set(arrayOfNamesGroop1Student2), Set(arrayOfNamesGroop2Student1)]).count != 2 {
           match += 1
        }
        if Set([Set(arrayOfNamesGroop1Student2), Set(arrayOfNamesGroop2Student2)]).count != 2 {
           match += 1
        }
        print(arrayOfNamesGroop1Student1)
        print(arrayOfNamesGroop1Student2)
        print(arrayOfNamesGroop2Student1)
        print(arrayOfNamesGroop2Student2)
//        print(setOfStudents)
        print(match)
        // Иван Петров, Иванов Петр.
        // Петр Иванов, Иван Петров.
        
//        let source = sourceTimeArray[0]! * 60 + sourceTimeArray[1]!
//        let destination = destinationTimeArray[0]! * 60 + destinationTimeArray[1]!
//        let timeZone = timeZoneDiffInt * 60
        
//        let diff = destination - (source + timeZone)
//
        var result = ""
        if match  == 2 {
            result = "YES"
        } else {
            result = "NO"
        }
        
        return result
    }
    
    
    
    
}

final class Application {
    
    func main() {
        let reader = DataReader()
        let students = reader.read()
        let result = students.findDiff()
        print(result)
    }
    
//    func main2() {
//        set1 = readline = array1 + array2
//        let student1 = Student(name1: array1[0], name2: array1[1])
//        let student2 = Student(name1: array2[0], name2: array2[1])
//
//        let set1 = Set([student1, student2])
//        let set2 = Set([student1, student2])
//    }
    
    // MARK: - Private

    private class DataReader {
        
        func read() -> Students {
            print("Введите Имена и Фамилии первой группы студентов: ")
            let groop1 = readLine() ?? ""
            print("Введите Имена и Фамилии второй группы студентов: ")
            let groop2 = readLine() ?? ""
            
            let students = Students(
                groop1: groop1,
                groop2: groop2
            )
            
            return students
        }
    }
}

let application = Application()
application.main()
