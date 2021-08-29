import UIKit

let months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]
enum months1: String {
    case jan = "January"
    var dayOfMonth: Int {
        switch self {
        case .jan:
            return 31
        default:
            30
        }
    }

}

struct SimpleDate {
    var month: String
    var day: Int {  // Добавляем наблюдатель ...
        didSet {
            if day > 31 && month == months[0] {
                day = 1
                month = months[1]
            }
        }
    }
    
    mutating func advance() {
        day += 1
    }
}

protocol Clothers {
    
    var size: Int { get set }
    var color: UIColor { get set }
    var material: String { get set }
    func someFunc()
}

struct TShirt: Clothers {
    
    var color: UIColor
    var size: Int
    var material: String
    func someFunc() {
        true
    }
}

var tShirt = TShirt(color: .black, size: 34, material: "")
tShirt.someFunc()

func unicDict(dict: [String: Int]) -> Bool {
    let set = Set(dict.values)
    return set.count == dict.values.count
}

var someValue: Int?
//someValue = 5
switch someValue {
case .some(let x):
    print(x)
case .none:
    print("No value")
}

//someValue = nil
