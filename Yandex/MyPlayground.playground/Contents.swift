import UIKit

let input = readLine() ?? ""
let nums = input.split(separator: " ")
var result = 0
nums.forEach {
    let num = Int($0)!
    result += num
}
print(result)
