import Foundation

//MARK: Protocol

protocol VerifRouterInputProtocol: AnyObject {
    
    var viewController: VerificationViewController? { get }
    
    func openChatListVC()
}

//MARK: Router

final class VerifRouter: VerifRouterInputProtocol {
    
    weak var viewController: VerificationViewController?
    
    func openChatListVC() {
//        self.viewController?.navigationController?.show(ChatListViewController(), sender: nil)
//        self.viewController?.navigationController?.present(ChatListViewController(), animated: true)
//        self.viewController?.present(ChatListViewController(), animated: true)
        self.viewController?.navigationController?.popViewController(animated: true)
                self.viewController?.navigationController?.pushViewController(ChatListViewController(), animated: true)

    }
}
