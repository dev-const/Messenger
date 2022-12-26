import Foundation

//MARK: Protocols

protocol AuthViewOutputProtocol: AnyObject {
    var view: AuthViewInputProtocol? { get }
    var router: AuthRouterInputProtocol!  { get }
    
    func sendToCheckUserInfo(userName: String, phoneNumber: String)
}

protocol AuthInteractorOutputProtocol: AnyObject {
    var interactor: AuthInteractorInputProtocol! { get }
    
    func successfulUserNameVerification(_ answer: ResponseMessages.RawValue)
    func successfulPhoneNumberVerification(_ answer: ResponseMessages.RawValue)
    
    func failedUserNameVerification(_ answer: ResponseMessages.RawValue)
    func failedPhoneNumberVerification(_ answer: ResponseMessages.RawValue)
    func presentVerificationVC()
}

//MARK: AuthPresenter

final class AuthPresenter {
    
    weak var view: AuthViewInputProtocol?
    var interactor: AuthInteractorInputProtocol!
    var router: AuthRouterInputProtocol!
}

//MARK: AuthViewOutputProtocol

extension AuthPresenter: AuthViewOutputProtocol {
    
    func sendToCheckUserInfo(userName: String, phoneNumber: String) {
        interactor.checkUserName(userName)
        interactor.checkUserPhoneNumber(phoneNumber)
    }
}

//MARK: AuthInteractorOutputProtocol

extension AuthPresenter: AuthInteractorOutputProtocol {

    func successfulUserNameVerification(_ answer: ResponseMessages.RawValue) {
        view?.correctUserNameLabel()
    }
    
    func successfulPhoneNumberVerification(_ answer: ResponseMessages.RawValue) {
        view?.correctPhoneNumberLabel()
    }
    
    func failedUserNameVerification(_ answer: ResponseMessages.RawValue) {
        view?.didIncorrectUserNameLabel()
    }
    
    func failedPhoneNumberVerification(_ answer: ResponseMessages.RawValue) {
        view?.didIncorrectPhoneNumberLabel()
    }
    
    func presentVerificationVC() {
        router.presentVerificationVC()
    }
}
