import Foundation

protocol WelcomeViewOutputProtocol: AnyObject {
    
    var view: WelcomeViewInputProtocol! { get }
    var router: WelcomeRouterInputProtocol! { get }
    
    func openNextVC(_ viewController: UIViewController)
}
