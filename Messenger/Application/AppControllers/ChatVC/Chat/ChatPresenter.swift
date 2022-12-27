import Foundation

//MARK: Protocols

protocol ChatViewOutputProtocol: AnyObject {
    
    var view: ChatViewInputProtocol? { get }
    var router: ChatRouterInputProtocol! { get }
}

protocol ChatInteractorOutputProtocol: AnyObject {
    
    var interactor: ChatInteractorInputProtocol! { get }
}

//MARK: Presenter

final class ChatPresenter {
    weak var view: ChatViewInputProtocol?
    var router: ChatRouterInputProtocol!
    var interactor: ChatInteractorInputProtocol!
}

//MARK: Extension - ChatViewOutputProtocol

extension ChatPresenter: ChatViewOutputProtocol {
    
}

//MARK: Extension - ChatInteractorOutputProtocol

extension ChatPresenter: ChatInteractorOutputProtocol {
    
}
