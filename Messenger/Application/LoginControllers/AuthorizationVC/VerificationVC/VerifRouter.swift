import Foundation

//MARK: Protocol

protocol VerifRouterInputProtocol: AnyObject {
    
    var view: VerificationViewController? { get }
    
    func openChatListVC()
}

//MARK: Router

final class VerifRouter: VerifRouterInputProtocol {
    
    weak var view: VerificationViewController?
    
    func openChatListVC() {
//        self.viewController?.navigationController?.show(ChatListViewController(), sender: nil)
//        self.viewController?.navigationController?.present(ChatListViewController(), animated: true)
//        self.viewController?.present(ChatListViewController(), animated: true)
        self.view?.navigationController?.popViewController(animated: true)
        self.view?.navigationController?.pushViewController(ChatListAssembly.buildModule(), animated: true)

    }
}
