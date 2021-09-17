import UIKit

/*
 1. Есть enum
 
 enum Coin: Int {
   case penny = 1
   case nickel = 5
   case dime = 10
   case quarter = 25
 }

 И массив экземпляров

 let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

 Написать функцию, принимающую массив монет и возвращающую общую сумму.
 */

enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .nickel, .dime, .penny, .dime, .quarter]

func sum(array: [Coin]) -> Int {
   return array.map {$0.rawValue}.reduce(0, { x, y in x + y })
}

print("Summ of coins is \(sum(array: coinPurse)) cents")

/*
 2. Есть enum

 enum Month: Int {
   case january = 1, february, march, april, may, june, july, august, september, october, november, december
 }

 Написать computed property получения количества месяцев до лета. Нужно учесть отрицательное значение, если лето в текущем году уже прошло.
 */

enum Month: Int {
  case january = 1, february, march, april, may, june, july, august, september, october, november, december
    
    var countMonthToSummer: Int {
        switch self {
        case .june, .july, .august:
            print("It's summer now!")
            return 0
        case .january, .february, .march, .april, .may:
            print("You should wait \(6 - self.rawValue) months to summer.")
            return 6 - self.rawValue
        case .september, .october, .november, .december:
            print("You should wait \(12 - self.rawValue + 6) months to summer.")
            return 12 - self.rawValue + 6
        }
//       return 0
    }
}
Month.december.rawValue
let currentMonth: Month = .december
currentMonth.countMonthToSummer
