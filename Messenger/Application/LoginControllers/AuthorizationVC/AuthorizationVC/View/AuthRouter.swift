import Foundation

//MARK: Protocol

protocol AuthRouterInputProtocol {
    
    var view: AuthorizationViewController? { get }
    
    func presentVerificationVC()
}

//MARK: Router

final class AuthRouter: AuthRouterInputProtocol {
    
    weak var view: AuthorizationViewController?
    
    func presentVerificationVC() {
        self.view?.navigationController?.pushViewController(VerifAssembly.buildModule(), animated: false)
    }
}
