import Foundation

//MARK: Protocol

protocol WelcomeRouterInputProtocol: AnyObject {
    
    var view: WelcomeViewController? { get }
    
    func pushRegVC()
    func pushAuthVC()
}

//MARK: Router

final class WelcomeRouter: WelcomeRouterInputProtocol {
    
    weak var view: WelcomeViewController?
    
    func pushRegVC() {
        self.view?.navigationController?.pushViewController(RegAssembly.buildModule(), animated: false)
    }
    
    func pushAuthVC() {
        self.view?.navigationController?.pushViewController(AuthAssembly.buildModule(), animated: false)
    }
}
