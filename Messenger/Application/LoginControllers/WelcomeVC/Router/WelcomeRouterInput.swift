import UIKit

protocol WelcomeRouterInputProtocol: AnyObject {
    
    var view: UIViewController! { get set }
    
    func openNextVC()
}
