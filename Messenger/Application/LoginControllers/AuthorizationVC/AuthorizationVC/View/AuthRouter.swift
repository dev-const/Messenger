import Foundation

//MARK: Protocol

protocol AuthRouterInputProtocol {
    
    var viewController: AuthorizationViewController? { get }
    
    func presentVerificationVC()
}

//MARK: Router

final class AuthRouter: AuthRouterInputProtocol {
    
    weak var viewController: AuthorizationViewController?
    
    func presentVerificationVC() {
        self.viewController?.navigationController?.pushViewController(VerificationViewController(), animated: false)
    }
}
