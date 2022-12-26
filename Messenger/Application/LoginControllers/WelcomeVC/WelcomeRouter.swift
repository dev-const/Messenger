import Foundation

//MARK: Protocol

protocol WelcomeRouterInputProtocol: AnyObject {
    
    var viewController: WelcomeViewController? { get }
    
    func pushRegVC()
    func pushAuthVC()
}

//MARK: Router

final class WelcomeRouter: WelcomeRouterInputProtocol {
    
    weak var viewController: WelcomeViewController?
    
    func pushRegVC() {
        self.viewController?.navigationController?.pushViewController(RegistrationViewController(), animated: false)
    }
    
    func pushAuthVC() {
        self.viewController?.navigationController?.pushViewController(AuthorizationViewController(), animated: false)
    }
}
