import Foundation

struct Matrix {
    
    let firstArray: [Int?]
    let secondArray: [Int?]
    let thirdArray: [Int?]
    let forthArray: [Int?]
    
    var matrix: [[Int?]]
    
    init(firstArr: [Int?], secArr: [Int?], thrArr: [Int?], forArr: [Int?]) {
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
        var matrix = reader.read()
        let result = matrix.matrix
        print(result)
    }
    

    
    // MARK: - Private

    private class DataReader {
        
        func read() -> Matrix {
            print("Введите 4 числа первого массива: ")
            let firstString = readLine() ?? ""
            print("Введите 4 числа второго массива: ")
            let secondString = readLine() ?? ""
            print("Введите 4 числа третьего массива: ")
            let thirdString = readLine() ?? ""
            print("Введите 4 числа четвёртого массива: ")
            let forthString = readLine() ?? ""
            
            let firstArray = firstString.split(separator: " ").map(String.init).map(Int.init)
            let secondArray = secondString.split(separator: " ").map(String.init).map(Int.init)
            let thirdArray = thirdString.split(separator: " ").map(String.init).map(Int.init)
            let forthArray = forthString.split(separator: " ").map(String.init).map(Int.init)
            
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
    }
}

let application = Application()
application.main()
