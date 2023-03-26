import UIKit

//class Controller {
//    var workItem: DispatchWorkItem?
//    //This function gets triggered everytime user adds a new letter to query
//    func getSearchResults(query: String) {
//        workItem?.cancel ()
//        let newWorkItem = DispatchWorkItem {
//            print("sent a backend request for \(query)")
//            //async task to fetch results based on the query
//        }
//        workItem = newWorkItem
//        DispatchQueue.global() .asyncAfter (
//            deadline: .now() + .milliseconds (30), execute: newWorkItem)
//    }
//}
//let cont = Controller()
//cont.getSearchResults(query: "s")
//cont.getSearchResults(query: "sh")
//Thread.sleep(forTimeInterval: Double.random(in: 1...3))
//cont.getSearchResults(query: "shi")
//cont.getSearchResults(query: "shir")



let queue = DispatchQueue(label: "com.gcd.Queue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 3)
for i in 0 ... 12 {
   queue.async {
      let movieNumber = i + 1
      semaphore.wait()
      print("Downloading movie", movieNumber)
      sleep(2)
      print("Downloaded movie", movieNumber)
      semaphore.signal()
   }
}
