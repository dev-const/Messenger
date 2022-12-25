import Foundation

//MARK: Protocol

protocol WelcomeRouterInputProtocol: AnyObject {
    
    var viewController: WelcomeViewController? { get set }
    
    func presentRegVC()
    func presentAuthVC()
}

//MARK: Router

final class WelcomeRouter: WelcomeRouterInputProtocol {
    
    weak var viewController: WelcomeViewController?
    
    func presentRegVC() {
        self.viewController?.present(RegAssembly.build(), animated: true)
    }
    
    func presentAuthVC() {
        self.viewController?.present(AuthorizationViewController(), animated: true, completion: {
//            AuthAssembly.build()
        })
    }
}
