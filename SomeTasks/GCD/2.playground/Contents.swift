import UIKit

class MainViewController : UIViewController {
    var showAnimatedPresentation: DispatchWorkItem?
    // will be called once the view shows up on the screen
    override func viewDidAppear(_ animated: Bool) {
        showAnimatedPresentation = DispatchWorkItem {
            //show some cool animated presention
            print ("showing animated Presentation")
        }
        //show the animated presentation, if the user hasnt interacted with
        //the app for more than 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4) , execute: showAnimatedPresentation! )
    }
    //This will be called when the user interacts with the app
    func usedTheApp() {
        // will cancel the workitem from executing
        showAnimatedPresentation?.cancel ()
        print ("app used" )
    }
}

let mc = MainViewController()
//mc.usedTheApp()

mc.viewDidAppear(false)
Thread.sleep(forTimeInterval: 6)
mc.usedTheApp()
