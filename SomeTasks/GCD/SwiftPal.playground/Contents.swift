import UIKit

// Create Group
let group = DispatchGroup()

// Date created for demo purposes
let date = Date()

// Create a Concurrent Queue
let queue = DispatchQueue(label: "com.swiftpal.dispatch.queue", attributes: .concurrent)

// Link the Queue to Group
queue.async(group: group) {  // Group Linked
    Thread.sleep(forTimeInterval: 3)    // Wait for 3 seconds
    let difference = Date().timeIntervalSince(date)
    print("Task 1 Done with difference of \(difference.rounded()) seconds")
}

// Create a Serial queue
let queue2 = DispatchQueue(label: "com.swiftpal.dispatch.queue2")

// Link the Queue to Group
queue2.async(group: group) {  // Group Linked
    Thread.sleep(forTimeInterval: 1)    // Wait for 1 second
    let difference = Date().timeIntervalSince(date)
    print("Task 2 Done with difference of \(difference.rounded()) seconds")
}

// Notify Completion of tasks on main thread.
group.notify(queue: DispatchQueue.main) {
    // Update UI
    Thread.sleep(forTimeInterval: 1)    // Wait for 1 second
    let difference = Date().timeIntervalSince(date)
    print("All tasks executed with difference of \(difference.rounded()) seconds")
}
