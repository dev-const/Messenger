import Foundation

//MARK: Protocol

protocol RegRouterInputProtocol: AnyObject {
    
    var viewController: RegistrationViewController? { get }
   
    func presentChatListVC()
}

//MARK: Router

final class RegRouter: RegRouterInputProtocol {
    
    weak var viewController: RegistrationViewController?
    
    func presentChatListVC() {
        self.viewController?.present(ChatListViewController(), animated: true, completion: {
            self.viewController?.dismiss(animated: true)
        })
    }
}
