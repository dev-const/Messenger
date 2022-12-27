import Foundation

//MARK: Protocol

protocol ChatListViewOutputProtocol: AnyObject {
    var view: ChatListViewController? { get }
    var router: ChatListRouterInputProtocol! { get }
}

protocol ChatListInteractorOutputProtocol: AnyObject {
    var interactor: ChatListInteractorInputProtocol! { get }
}

//MARK: Presenter

final class ChatListPresenter {
    weak var view: ChatListViewController?
    var interactor: ChatListInteractorInputProtocol!
    var router: ChatListRouterInputProtocol!
}

//MARK: Extension - ChatListViewOutputProtocol

extension ChatListPresenter: ChatListViewOutputProtocol {
    
}

//MARK: Extension - ChatListInteractorOutputProtocol

extension ChatListPresenter: ChatListInteractorOutputProtocol {
    
}
