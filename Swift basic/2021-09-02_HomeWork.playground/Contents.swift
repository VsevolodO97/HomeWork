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
    private(set) var filmsLibrary: [String: List] = [:]
    
    func addList(list: List) {
        filmsLibrary.merge([list.listName : list]) { (current, _) in current }
    }
    
    func list(forName: String) -> List? {
//        guard let _ = filmsLibrary.firstIndex(where: {$0.key == forName})  else {
//            print("\(userName) has not library of films named \(forName)")
//            return nil
//        }
        print(filmsLibrary[forName]?.filmList ?? print("\(userName) has not library of films named \(forName)"))
        return filmsLibrary[forName]
    }
    
    init(userName: String, filmsLibrary: [String: List] = [:]) {
        self.userName = userName
        self.filmsLibrary = filmsLibrary
    }
}

class List {
    var listName: String
    var filmList: [String]
    
    init(listName: String, filmList: [String]) {
        self.listName = listName
        self.filmList = filmList
    }
    
    func print() {
        Swift.print(filmList)
    }
}

var horror = List(listName: "Horror", filmList: ["The katcher", "The call"])
var crimeMovies = List(listName: "Crime movies", filmList: ["Bad Education", "Red, White, and Blue", "The Invisible Man"])
var vasil = User(userName: "Vasil")
vasil.addList(list: horror)
//print(vasil.filmsLibrary)
vasil.list(forName: "Horror")
vasil.list(forName: "Humor")
var peter = User(userName: "Peter", filmsLibrary: ["Humor" : List(listName: "Humor", filmList: ["Friendsgiving", "Downhill", "Love Wedding Repeat"])])
peter.filmsLibrary
//peter.filmsLibrary["Humor"] = List(listName: "", filmList: [])
peter.filmsLibrary["Humor"] // почему не создался объект при инициализации? А если создался, то как получить к нему доступ?
//horror.print()

peter.filmsLibrary["Humor"]
peter.addList(list: horror)
peter.list(forName: "Horror")
peter.addList(list: List(listName: "Horror", filmList: ["Saw"]))
peter.list(forName: "Horror")
peter.filmsLibrary["Horror"]?.filmList.append("Saw")
peter.list(forName: "Horror")
vasil.list(forName: "Horror")
vasil.filmsLibrary["Horror"]?.filmList.append("Nightmare")
peter.list(forName: "Horror")
vasil.list(forName: "Horror")
/*При изменении списка фильмов у одного пользователя, меняется тот же самый список фильмов у другого пользователя. Это происходит потому что пользователи не хранят собственные списки фильмов, а лишь ссылаются на один и тот же экземпляр клааса List.
*/

struct User1 {
    var userName: String
    var filmsLibrary: [String: List1] = [:]
    
    mutating func addList(list: List1) {
        filmsLibrary.merge([list.listName : list]) { (current, _) in current }
    }
    
    func list(forName: String) -> List1? {
//        guard let _ = filmsLibrary.firstIndex(where: {$0.key == forName})  else {
//            print("\(userName) has not library of films named \(forName)")
//            return nil
//        }
        print(filmsLibrary[forName]?.filmList ?? print("\(userName) has not library of films named \(forName)"))
        return filmsLibrary[forName]
    }
    
    init(userName: String, filmsLibrary: [String: List1] = [:]) {
        self.userName = userName
        self.filmsLibrary = filmsLibrary
    }
}

struct List1 {
    var listName: String
    var filmList: [String]
    
//    init(listName: String, filmList: [String]) {
//        self.listName = listName
//        self.filmList = filmList
//    }
    
    func print() {
        Swift.print(filmList)
    }
}

var horror1 = List1(listName: "Horror", filmList: ["The katcher", "The call"])
var oleg = User1(userName: "Oleg")
var boris = User1(userName: "Boris")
oleg.addList(list: horror1)
oleg.list(forName: "Horror")
oleg.filmsLibrary["Horror"]?.filmList.append("Saw")
oleg.list(forName: "Horror")
boris.addList(list: horror1)
boris.list(forName: "Horror")
boris.filmsLibrary["Horror"]?.filmList.append("Nightmare")
boris.list(forName: "Horror")
oleg.list(forName: "Horror")

/*
 При использовании структур, каждому экземпляру структуры User1 присваивается свой экземпляр структуры List1. Поэтому при изменении списка фильмов у одного, список фильмов у другого не меняется. Value типы хранят свои данные для каждого экземпляра.
 */
/*
 2. Создать набор объектов для поддержки магазина футболок. Самостоятельно решить, должен ли каждый объект быть классом или структурой и почему.

 TShirt: представляет собой вариант футболки. У каждой футболки есть размер, цвет, цена и опциональное изображение спереди.
 User: зарегистрированный пользователь приложения магазина футболок. У пользователя есть имя, адрес электронной почты и корзина для покупок.
 Address: представляет адрес доставки и содержит имя, улицу, город и почтовый индекс.
 ShoppingCart: содержит текущий заказ, который состоит из массива футболок, которые пользователь хочет купить, а также метода расчета общей стоимости. Кроме того, есть адрес, который указывает, куда будет отправлен заказ.
 */

struct TShirt {
    var size: Int
    var color: String
    var price: Double
    var frontImage: UIImageView?
}

struct MagazinUser {
    var name: String
    var email: String
    var cart: ShoppingCart
}

struct Address {
    var name: String    // не понятно что за имя
    var street: String
    var sity: String
    var postIndex: Int
}

struct ShoppingCart {
    var cart: [TShirt]
    var deliveryAddres: Address
    
    func totalPrice() -> Double {
        var bill: Double = 0
        for tShirt in cart {
           bill += tShirt.price
        }
        return bill
    }
}

let yellowTShirt = TShirt(size: 45, color: "Yellow", price: 14, frontImage: nil)
let redTSirt = TShirt(size: 40, color: "Red", price: 30, frontImage: nil)
let sergAdress = Address(name: "SergHouse", street: "Main street", sity: "Main sity", postIndex: 100_001)
let sergCart = ShoppingCart(cart: [redTSirt, yellowTShirt], deliveryAddres: sergAdress)

var serg = MagazinUser(name: "Serg", email: "serg@mail.ru", cart: sergCart)
serg.cart.totalPrice()
serg.name
serg.cart.deliveryAddres
/*
 В этой задаче использовал структуры, так как нет необходимости использовать классы:
    - нет необходимости в наследовании;
    - нет необходимости в создании ссылочных сущностей.
 */
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
let one = Size()
