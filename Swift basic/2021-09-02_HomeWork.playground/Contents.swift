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


/*
 1. Рассмотрим приложение для просмотра фильмов. Пользователи могут создавать списки фильмов и делиться этими списками с другими пользователями. Нужно создать классы User и List, который использует семантику ссылок для поддержки списков между пользователями.

 - User: есть метод addList (_ :), который добавляет данный список в словарь объектов List (используя имя в качестве ключа) и list (forName 🙂 -> List?, который возвращает список для предоставленного имени.
 - List: содержит название и массив названий фильмов. Метод print выводит все фильмы в списке.

 Далее нужно создать двух пользователей. У них должны быть списки и часть списком доступна сразу двух (пользователи поделились ими). Если оба пользователя изменят один и тот же список, что будет?
 Что произойдет, если реализовать то же самое со структурами?

 */

class User {
    var userName: String
    var filmsLibrary: [String: List] = [:]
    
    func addList(list: List) {
        filmsLibrary.merge([list.listName : list]) { (current, _) in current }
    }
    
    func list(forName: String) -> List? {
        guard let _ = filmsLibrary.firstIndex(where: {$0.key == forName})  else {
            print("\(userName) has not library of films named \(forName)")
            return nil
        }
        print(filmsLibrary[forName] ?? print("\(userName) has not library of films named \(forName)"))
        return filmsLibrary[forName]
    }
    
    init(userName: String) {
        self.userName = userName
    //    self.filmsLibrary = filmsLibrary
    }
}

class List {
    var listName: String
    var genreList: [String]
    
    init(listName: String, genreList: [String]) {
        self.listName = listName
        self.genreList = genreList
    }
}

var horror = List(listName: "Horror", genreList: ["The katcher", "The call"])
var vasil = User(userName: "Vasil")
vasil.addList(list: horror)
print(vasil.filmsLibrary)
vasil.list(forName: "Horror")
vasil.list(forName: "Humor")
