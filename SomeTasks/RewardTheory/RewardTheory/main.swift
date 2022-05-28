import Foundation

struct Department {
    
    // Value
    let grade: Int
    var reward: Int = 0
    
    // Tree
    let parent: Int
    
}

struct Company {
    var departments: [Department]
    let summ: Int
    let numberOfHeads: Int
    
    mutating func countRewards() -> String {
        var summForBranch = 0
        for i in 0..<departments.count {
           
         
            let branch = departments.filter { $0.parent == i }
            guard branch.isEmpty == false else { continue  }
            
            if branch[0].parent == 0 {
                summForBranch = summ
            }
            let summOfGrades = branch.map { $0.grade }.reduce(0, { x, y in
                x + y
            })
            let factor: Double = Double(summForBranch) / Double(summOfGrades)
//            departments.filter {$0.parent == i}.map { $0.reward = Int(Double($0.grade) * factor) }
            for j in 0..<departments.count {
            
            if departments[j].parent == i {
                departments[j].reward = Int(Double(departments[j].grade) * factor)
            }
            }
        }
        return departments.map { String($0.reward) }.joined(separator: " ")
    }
    
}


final class Application {
    
    func main() {
        let reader = DataReader()
        var heads = reader.read()
        let result = heads.countRewards()
        print(result)
    }
    

    
    // MARK: - Private

    private class DataReader {
        
        func read() -> Company {
            print("Введите количество отделов в компании и сумму премирования: ")
            let firstString = readLine() ?? ""
            print("Введите оценки эффективности отделов: ")
            let secondString = readLine() ?? ""
            print("Введите указатели подчинённости отделов: ")
            let thirdString = readLine() ?? ""
            
            let numberOfHeadsAndSummArray = firstString.split(separator: " ").map(String.init).map(Int.init)
            
            let gradesArray = secondString.split(separator: " ").map(String.init).map(Int.init)
            let parentsArray = thirdString.split(separator: " ").map(String.init).map(Int.init)
            let numberOfHeads = numberOfHeadsAndSummArray[0]!
            let summ = numberOfHeadsAndSummArray[1]!
            
            if numberOfHeads != gradesArray.count || numberOfHeads != parentsArray.count {
                fatalError("Вы ввели неверные данные!")
            }
            
            var departments: [Department] = []
            
            for i in 0..<numberOfHeads {
                departments.append(Department(grade: gradesArray[i]!, parent: parentsArray[i]!))
            }
            
            let company = Company(
                departments: departments, summ: summ, numberOfHeads: numberOfHeads
            )
            
            
            return company
        }
    }
}

let application = Application()
application.main()
