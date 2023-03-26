import UIKit

final class A {
    private let view = UIView()
    
    deinit {
        view.removeFromSuperview()
    }
}
