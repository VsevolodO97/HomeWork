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
            let summOfGrades = branch
                .map { $0.grade }
                .reduce(0, { x, y in
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
        var company = reader.read()
        let result = company.countRewards()
        print(result)
    }
        
    // MARK: - Private

    private class DataReader {
        
        private class DepartmentData {
            
            private let rawString: String
            
            lazy private(set) var arrayData: [Int] = {
                return rawString
                    .split(separator: " ")
                    .map(String.init)
                    .compactMap(Int.init)
            }()
            
            init(data: String) {
                self.rawString = data
            }
        }
        
        func read() -> Company {
            print("Введите количество отделов в компании и сумму премирования: ")
            let firstString = readLine() ?? ""
            let departmentHeadsAndSumm = DepartmentData(data: firstString)
            print("Введите оценки эффективности отделов: ")
            let secondString = readLine() ?? ""
            let departmentEfficiency = DepartmentData(data: secondString)
            print("Введите указатели подчинённости отделов: ")
            let thirdString = readLine() ?? ""
            let departmentParents = DepartmentData(data: thirdString)
            
            let numberOfHeads = departmentHeadsAndSumm.arrayData[0]
            let summ = departmentHeadsAndSumm.arrayData[1]
            
            if numberOfHeads != departmentEfficiency.arrayData.count
                || numberOfHeads != departmentParents.arrayData.count {
                fatalError("Вы ввели неверные данные!")
            }
            
            var departments: [Department] = []
            
            for i in 0..<numberOfHeads {
                let departament = Department(
                    grade: departmentEfficiency.arrayData[i],
                    parent: departmentParents.arrayData[i]
                )
                departments.append(departament)
            }
            
            let company = Company(
                departments: departments,
                summ: summ,
                numberOfHeads: numberOfHeads
            )
            
            return company
        }
    }
}

let application = Application()
application.main()
