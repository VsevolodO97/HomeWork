import Foundation

final class Application {
    
    func main() {
        let reader = DataReader()
        var result = reader.read()
        print(result)
    }
        
    // MARK: - Private

    private class DataReader {
        
        func read() -> String {
            print("Введите данные:")
            return readLine() ?? ""
        }
    }
}

let application = Application()
application.main()
