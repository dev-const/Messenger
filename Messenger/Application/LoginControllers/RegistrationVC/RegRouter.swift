import Foundation

//MARK: Protocol

protocol RegRouterInputProtocol: AnyObject {
    
    var view: RegistrationViewController? { get }
   
    func presentChatListVC()
}

//MARK: Router

final class RegRouter: RegRouterInputProtocol {
    
    weak var view: RegistrationViewController?
    
    func presentChatListVC() {
        self.view?.present(ChatListViewController(),
                           animated: true)
    }
}
