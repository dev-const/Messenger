import Foundation

//MARK: Protocols

protocol RegViewOutputProtocol: AnyObject {
    
    var view: RegViewInputProtocol? { get }
    var interactor: RegInteractorInputProtocol! { get }
    var router: RegRouterInputProtocol!  { get }
    
    func userSelectedCreateAccount(userName: String, phoneNumber: String)
}

protocol RegInteractorOutputProtocol: AnyObject {
    
    func didFCreateAccount()
    func didIncorrectUserNameLabel()
    func didIncorrectPhoneNumberLabel()
    func didReceiveError(error: String)
    func presentChatListVC()
}

//MARK: Presenter

final class RegPresenter {

    weak var view: RegViewInputProtocol?
    var interactor: RegInteractorInputProtocol!
    var router: RegRouterInputProtocol!
    
    private var userNameIsCorrect = false /* false - on default */
    private var userPhoneNumberIsCorrect = false /* false - on default */
}

//MARK: RegViewOutputProtocol

extension RegPresenter: RegViewOutputProtocol {
    
    func userSelectedCreateAccount(userName: String, phoneNumber: String) {
        //FIXME: - change this method
        self.presentChatListVC()
    }
}


//MARK: RegInteractorOutputProtocol

extension RegPresenter: RegInteractorOutputProtocol {
    
    func didIncorrectUserNameLabel() {
        view?.didIncorrectUserNameLabel()
    }
    
    func didIncorrectPhoneNumberLabel() {
        view?.didIncorrectPhoneNumberLabel()
    }
    
    func presentChatListVC() {
        router.presentChatListVC()
    }
    
    
    func didFCreateAccount() {
        self.presentChatListVC()
    }
    
    func didReceiveError(error: AlertMessages.RawValue) {
        
    }
}
