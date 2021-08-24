import UIKit

/*
 Описать структуру FuelTank

 struct FuelTank {
     var level: Double // уровень топлива в баке
 }

 1. Добавить stored-свойство lowFuel, тип Bool
 2. Когда уровень топлива в баке меньше 10%, lowFuel должен сигнализировать о недостатке топлива
 3. Когда выше или равен 10%, сигнал должен уйти
 4. Ограничить значения свойств level отрезком от 0.0 до 1.0
 5. Написать структуру Car, которая включает в себя поле структуры FuelTank
 */

struct FuelTank {
    
    static let minLevel: Double = 0.0  // минимальный уровень топлива в баке
    static let maxLevel: Double = 1.0  // максимальный уровень топлива в баке
    
    var lowFuel: Bool    // индикатор низкого уровня топлива в баке
    var level: Double = 0.0 { // уровень топлива в баке
        didSet {
            if level > FuelTank.maxLevel {
                level = FuelTank.maxLevel    // ограничиваем уровень топлива максимальным значением
            }
            if level < 0.1 {
                lowFuel = true  // синализируем о низком уровне топлива, если уровень меньше 10%
            } else {
                lowFuel = false // при уровне топлива больше или равно 10% выключаем сигнализатор
            }
            if level < FuelTank.minLevel {
                level = FuelTank.minLevel    // ограничиваем уровень топлива минимальным значением
            }
        }
    }
    init(level: Double) {
        if level > FuelTank.maxLevel {
            self.level = FuelTank.maxLevel    // ограничиваем уровень топлива максимальным значением
        } else if level <= FuelTank.maxLevel && level >= FuelTank.minLevel{
            self.level = level
        } else if level < FuelTank.minLevel {
            self.level = FuelTank.minLevel  // ограничиваем уровень топлива минимальным значением
        }
        if level < 0.1 {
            lowFuel = true  // синализируем о низком уровне топлива, если уровень меньше 10%
        } else {
            lowFuel = false // при уровне топлива больше или равно 10% выключаем сигнализатор
        }
    }
}

var someFuel = FuelTank(level: 1.1)
print(someFuel)
someFuel.level = 1.1
print(someFuel)

// Создаем перечисление с названиями брендов автомобилей
enum ModelOfCar: String {
    case bmw = "BMW"
    case mercedes = "Mercedes-Benz"
    case audi = "Audi"
}
struct Car: CustomStringConvertible {
    var description: String {
        if fuelLevel.lowFuel {
        return "Your car model is \(model.rawValue), fuel level is \(fuelLevel.level) - indicator \"Low fuel\" is On."
        } else {
            return "Your car model is \(model.rawValue), fuel level is \(fuelLevel.level) - indicator \"Low fuel\" is Off."
        }
    }
    
    var model: ModelOfCar
    var fuelLevel: FuelTank
}

var myCar = Car(model: .mercedes, fuelLevel: FuelTank(level: 0.01))
print(myCar.fuelLevel.level, myCar.fuelLevel.lowFuel)   // при инициализации экземпляра наблюдатель не отрабатывает, поэтому пришлось написать инициализатор
myCar.fuelLevel.level = 1.01
print(myCar.fuelLevel)
print(myCar)

var anotherCar = Car(model: .audi, fuelLevel: FuelTank(level: 0.09))
print(anotherCar.fuelLevel)
print(anotherCar)
