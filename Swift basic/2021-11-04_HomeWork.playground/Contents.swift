import UIKit

/*
 1. Подробнее ознакомиться с перегрузкой операторов и созданием своих в Swift

 - https://nshipster.com/swift-operators/
 - https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID380
 - https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations
 - https://sarunw.com/posts/how-to-create-custom-operators-and-operators-overloading-in-swift/
 - https://www.raywenderlich.com/4018226-overloading-custom-operators-in-swift

 2. Реализовать префиксный оператор | для строки. Он должен переводить все символы строки в строчные
 3. Реализовать префиксный оператор ~ для дробных чисел. Он должен округлять число и переводить его в целое (правила округления можно выбрать любые)
 4. Реализовать постфиксный оператор ❗ для чисел. Он должен вычислять факториал числа.
 5. Реализовать инфиксный оператор /= для чисел. Он должен делить левый операнд на правый и присваивать результат левому операнду
 */

// 2. Реализовать префиксный оператор | для строки. Он должен переводить все символы строки в строчные
prefix operator |
prefix func |(_ string: String) -> String {
    string.lowercased()
}
let greeting = "Hello World!"
|greeting

// 3. Реализовать префиксный оператор ~ для дробных чисел. Он должен округлять число и переводить его в целое (правила округления можно выбрать любые)
prefix operator ~
prefix  func ~(_ number: Double) -> Int {
    Int(number.rounded())
}
let doubleNumber = 25.7
~doubleNumber

//4. Реализовать постфиксный оператор ❗ для чисел. Он должен вычислять факториал числа.
postfix operator ❗️
postfix func ❗️(_ number: Int) -> Int {
    if number == 1 {
        return 1
    } else {
        return number * (number - 1)❗️
    }
}

1❗️
2❗️
3❗️
4❗️
5❗️

// 5. Реализовать инфиксный оператор /= для чисел. Он должен делить левый операнд на правый и присваивать результат левому операнду
infix operator /=: MultiplicationPrecedence
func /=(_ lhs: inout Double, _ rhs: Double) -> Double {
    lhs = lhs / rhs
    print("Левый операнд теперь равняется = \(lhs)")
    return lhs
}
var a = 10
var b = 2

a /= b
print(a)
/*
 6. Новая задача с leetcode
 
 Given a non-negative integer x, compute and return the square root of x.

 Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

 Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.

  

 Example 1:
 Input: x = 4
 Output: 2
 
 Example 2:
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
  
 */

func mySqrt(_ x: Int) -> Int {
    var i = 0
    repeat {
        i += 1
    }
    while (i * i) <= x
            return i - 1
}

mySqrt(2)
