import Foundation

struct Matrix {
    
    private let firstArray: [Int]
    private let secondArray: [Int]
    private let thirdArray: [Int]
    private let forthArray: [Int]
    
    var matrix: [[Int]]
    
    init(firstArr: [Int], secArr: [Int], thrArr: [Int], forArr: [Int]) {
        self.firstArray = firstArr
        self.secondArray = secArr
        self.thirdArray = thrArr
        self.forthArray = forArr
        self.matrix = [firstArr, secArr, thrArr, forArr]
    }
    
//    mutating func createMatrix() -> [[Int?]] {
//
//        matrix[0] = firstArray
//        matrix[1] = secondArray
//        matrix[2] = thirdArray
//        matrix[3] = forthArray
//
//        return matrix
//    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        let matrix = reader.read()
        let result = matrix.matrix
        print(result)
    }
    

    
    // MARK: - Private

    private class DataReader {
        
        func read() -> Matrix {
            
            // Паттерн Билдер
            
            print("Введите 4 числа первого массива: ")
            let firstString = readLine() ?? ""
            print("Введите 4 числа второго массива: ")
            let secondString = readLine() ?? ""
            print("Введите 4 числа третьего массива: ")
            let thirdString = readLine() ?? ""
            print("Введите 4 числа четвёртого массива: ")
            let forthString = readLine() ?? ""
            
            let firstArray = transform(userData: firstString)
            let secondArray = transform(userData: secondString)
            let thirdArray = transform(userData: thirdString)
            let forthArray = transform(userData: forthString)
            
            if firstArray.count != 4 || secondArray.count != 4 || thirdArray.count != 4 || forthArray.count != 4 {
                fatalError("Вы ввели неверные данные!")
            }
            
            let matrix = Matrix(
                firstArr: firstArray,
                secArr: secondArray,
                thrArr: thirdArray,
                forArr: forthArray
            )
            
            return matrix
        }
        
        fileprivate func transform(userData: String) -> [Int] {
            userData
                .split(separator: " ")
                .map(String.init)
                .compactMap(Int.init)
        }
    }
}

let application = Application()
application.main()
