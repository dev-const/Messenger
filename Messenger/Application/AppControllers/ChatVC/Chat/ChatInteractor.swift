import Foundation

//MARK: Protocol

protocol ChatInteractorInputProtocol: AnyObject {
    var presenter: ChatInteractorOutputProtocol! { get }
}

//MARK: Interactor

final class ChatInteractor: ChatInteractorInputProtocol {
    
    weak var presenter: ChatInteractorOutputProtocol!
}

