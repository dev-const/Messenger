import Foundation

//MARK: Protocol

protocol ChatListInteractorInputProtocol: AnyObject {
    var presenter: ChatListInteractorOutputProtocol! { get }
}

//MARK: Interactor

final class ChatListInteractor: ChatListInteractorInputProtocol {
    
    weak var presenter: ChatListInteractorOutputProtocol!
}
