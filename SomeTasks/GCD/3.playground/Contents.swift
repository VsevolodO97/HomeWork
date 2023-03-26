import UIKit

class Controller {
    func getSomethingFromServer () {
        //work item to fetch something from server
        let newWorkItem = DispatchWorkItem {
            print ("fetching data from the server")
            //async task to fetch results based on the query
        }
        // work item to notify the view that the info is ready
        let notifyTheView = DispatchWorkItem {
            print ("the info from server has arrived")
        }
        // this get executed when newworkItem has finished execution
        newWorkItem.notify(queue: .main) {
            notifyTheView.perform()
        }
        DispatchQueue.global ().async(execute: newWorkItem)
    }
}
let cont = Controller ()
cont.getSomethingFromServer ()
