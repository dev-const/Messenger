import Foundation

//MARK: Protocol

protocol ChatListRouterInputProtocol: AnyObject {
    var view: ChatListViewController? { get }
    func showChatVC()
}

//MARK: Router

final class ChatListRouter: ChatListRouterInputProtocol {
    
    weak var view: ChatListViewController?
    
    func showChatVC() {
        self.view?.navigationController?.pushViewController(ChatAssembly.buildModule(), animated: true)
    }
}
