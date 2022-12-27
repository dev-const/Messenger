import Foundation
import MessageKit

//MARK: Protocol

protocol ChatRouterInputProtocol: AnyObject {
    var view: MessagesViewController? { get }
    func showChatListVC()
}

final class ChatRouter: ChatRouterInputProtocol {
    
    weak var view: MessagesViewController?
    func showChatListVC() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
