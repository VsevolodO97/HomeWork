import UIKit
import Foundation

struct Grade {
    let subject: String
    let position: Int
    let points: Double
    let letter: String
}

class Student {
    var firstName: String
    var lastName: String
    var grades: [Grade] = []
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func recordGrade(_ grade: Grade) {
        grades.append(grade)
    }
    
    func updateGrade(_ grade: Grade) {
        guard let index = grades.firstIndex(where: {$0.subject == grade.subject}) else {
            print("У студента \(fullName) отсутствует рейтинг предмета \(grade.subject)")
            return
        }
        grades.remove(at: index)
        grades.append(grade)
        print("Рейтинг предмета \(grade.subject) был обновлен. Новый рейтинг: position: \(grade.position), points: \(grade.points), letter: \"\(grade.letter)\"")
    }
}

extension Student {
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let ivan = Student(firstName: "Иван", lastName: "Иванов")
let history = Grade(subject: "History", position: 10, points: 95.5, letter: "A")
let math1 = Grade(subject: "Math", position: 50, points: 70.0, letter: "C")
let math2 = Grade(subject: "Math", position: 20, points: 90.0, letter: "B")
let geography = Grade(subject: "Geo", position: 5, points: 95, letter: "A")

let petr = Student(firstName: "Петр", lastName: "Петров")

ivan.recordGrade(history)
ivan.recordGrade(math1)
ivan.updateGrade(math2)
ivan.fullName

print(ivan.grades.map {$0.subject})
ivan.updateGrade(geography)
print(ivan.grades.map {$0.subject})
ivan.recordGrade(geography)
print(ivan.grades.map {$0.subject})
ivan.updateGrade(Grade(subject: "Geo", position: 40, points: 30, letter: "D"))
print(ivan.grades.filter {$0.subject == "Geo"}) // как распечатать красиво?
