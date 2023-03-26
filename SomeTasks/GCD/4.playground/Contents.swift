import UIKit

class Controller {
    func getSomethingFromServer () {
        //work item to fetch something from server
        let newWorkItem = DispatchWorkItem {
            print("fetching data from the server")
            print(Thread .current)
            //async task to fetch results based on the query
        }
//        / starts the execution of new work item asynchronously
        DispatchQueue.global().async(execute: newWorkItem)
        //blocks the thread until newWorkitem finishes execution
        newWorkItem.wait()
        //This gets printed after newWorkitem finishes execution
        print(Thread .current)
        print ("finished execution")
    }
}
let cont = Controller()
cont.getSomethingFromServer ()
