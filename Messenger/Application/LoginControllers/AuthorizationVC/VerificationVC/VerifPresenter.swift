import Foundation

//MARK: Protocol

protocol VerifViewOutputProtocol: AnyObject {
    
    var view: VerificationViewController? { get }
    var router: VerifRouterInputProtocol!  { get }
    
    func sendToCheckCode(_ code: String)
    func presentChatListVC()
}

protocol VerifInteractorOutputProtocol: AnyObject {
    var interactor: VerifInteractorInputProtocol! { get }

    func sendCodeAnswer(_ answer: ResponseMessages.RawValue)
}

//MARK: Presenter

final class VerifPresenter {
    
    weak var view: VerificationViewController?
    var router: VerifRouterInputProtocol!
    var interactor: VerifInteractorInputProtocol!
}


//MARK: VerifViewOutputProtocol

extension VerifPresenter: VerifViewOutputProtocol {
    
    func sendToCheckCode(_ code: String) {
        interactor.checkCode(code)
    }
    
    func presentChatListVC() {
        router.openChatListVC()
    }
}


//MARK: VerifInteractorOutputProtocol

extension VerifPresenter: VerifInteractorOutputProtocol {
    
    func sendCodeAnswer(_ answer: ResponseMessages.RawValue) {
        view?.changeStatustCode(answer)
    }
}
