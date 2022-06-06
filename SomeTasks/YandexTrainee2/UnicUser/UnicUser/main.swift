import Foundation

struct Emails {
    let numberOfEmails: Int
    var arrayOfEmails: [String]
    
    
    mutating func countUsers() -> Int {
        
        for i in 0..<arrayOfEmails.count {
            arrayOfEmails[i] = makeEmailClear(email: arrayOfEmails[i])
        }
        
        let countUsers = Set(arrayOfEmails).count
        
        return countUsers
    }
    
    func makeEmailClear(email: String) -> String {
        
        let partsOfEmail = email.split(separator: "@").map(String.init)
        let name = partsOfEmail[0]
        let domain = partsOfEmail[1]
        
        var clearName = name.filter { $0 != "." }
        if let i = clearName.firstIndex(of: "-") {
            clearName.removeSubrange(i..<clearName.endIndex)
        }
        
        var clearDomain: String
        var arrOfparts = domain.split(separator: ".").map(String.init)
        arrOfparts.removeLast()
        clearDomain = arrOfparts.joined(separator: ".")
        
        let clearEmail = clearName + "@" + clearDomain
        
        return clearEmail
        
    }
}

final class Application {
    
    func main() {
        let reader = DataReader()
        var emails = reader.read()
        let result = emails.countUsers()
        print(result)
    }
        
    // MARK: - Private

    private class DataReader {
        
        func read() -> Emails {
//            print("Введите количество e-mail-ов:")
            let firstString = readLine() ?? ""
            let numberOfEmails = Int(firstString) ?? 0
            
            
            var arrayOfEmails: [String] = []
            for _ in 0..<numberOfEmails {
//                print("Введите e-mail N\(i + 1):")
                let email = readLine() ?? ""
                arrayOfEmails.append(email)
            }
            
            let emails = Emails(numberOfEmails: numberOfEmails, arrayOfEmails: arrayOfEmails)
            
            return emails
            
        }
    }
}

let application = Application()
application.main()
