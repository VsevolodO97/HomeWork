import UIKit

/*
 Safety check 1
 A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.
 As mentioned above, the memory for an object is only considered fully initialized once the initial state of all of its stored properties is known. In order for this rule to be satisfied, a designated initializer must make sure that all of its own properties are initialized before it hands off up the chain.
 
 Safety check 2
A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization.
 
 Phase 1

 * A designated or convenience initializer is called on a class.
 Memory for a new instance of that class is allocated. The memory isn’t yet initialized.
 * A designated initializer for that class confirms that all stored properties introduced by that class have a value. The memory for these stored properties is now initialized.
 * The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties.
 * This continues up the class inheritance chain until the top of the chain is reached.
 * Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance’s memory is considered to be fully initialized, and phase 1 is complete.
 
 
 Phase 2

 * Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializers are now able to access self and can modify its properties, call its instance methods, and so on.
 * Finally, any convenience initializers in the chain have the option to customize the instance and to work with self.
 
 Вопрос: правильно ли я понял, что есть три процесса:
 - allocate memory
 - initializ memory
 - assign value
 
 Не понятно чем отличается второй от третьего и когда происходит третий.
 */


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}


let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}


/*
 - Создать три простых класса с именами A, B и C, где C наследуется от B, а B наследуется от A. В каждом инициализаторе класса вызвать print ("I'm <X>!") как до, так и после super.init(). После создать экземпляр C с именем c и посмотреть, что будет в логе.
 - Привести объект c к классу A.
 - Реализовать deinit для каждого класса. Например, можно создать экземпляр c внутри do {}, в результате чего счетчик ссылок станет нулевым при выходе из области видимости. Проанализировать, в каком порядке классы деинициализируются.

 */

class A {
    var number: Int
    init(number: Int) {
        self.number = number
        print("I'm <A>!")
    }
    deinit {
        print("Экземпляр класса А удален \(number)")
    }
}

class B: A {
    var name: String
    
    init(number: Int, name: String) {
        print("I'm <B1>!")
        self.name = name
        super .init(number: number)
        print("I'm <B2>!")
    }
    deinit {
        print("Экземпляр класса В удален \(name), \(number)")
    }
}

class C: B {
    var truth: Bool
    
    init(number: Int, name: String, truth: Bool) {
        print("I'm <C1>!")
        self.truth = truth
        super.init(number: number, name: name)
        print("I'm <C2>!")
    }
    deinit {
        print("Экземпляр класса С удален \(truth), \(name), \(number)")
    }
}

func doSomething() {
let c: C = C(number: 5, name: "!", truth: true)
    print(c.name)
}

doSomething()
let c: C = C(number: 6, name: "lsdfj", truth: true)
if let a = c as? A {
    print("Переменная с типа \"\(type(of: a))\" приведена к типу \"А\"")
}


(c as A).number
