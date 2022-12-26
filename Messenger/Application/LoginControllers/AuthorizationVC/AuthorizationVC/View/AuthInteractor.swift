import Foundation

//MARK: Protocol

protocol AuthInteractorInputProtocol: AnyObject {
    
    var presenter: AuthInteractorOutputProtocol! { get }
    
    func checkUserName(_ userName: String)
    func checkUserPhoneNumber(_ phoneNumber: String)
}

//MARK: Interactor

final class AuthInteractor: AuthInteractorInputProtocol {
    
    weak var presenter: AuthInteractorOutputProtocol!
    private var isCorrectUserName = false /* false - on default */
    private var isCorrectPhoneNumber = false  /* false - on default */
    
    func checkUserName(_ userName: String) {
//        guard !userName.isEmpty else { return }
        
        //FIXME: Логика проверки
        //MARK: Failed
        isCorrectUserName = false
        
        //MARK: Ok
        isCorrectUserName = true
        presenter.successfulUserNameVerification(ResponseMessages.ok.rawValue)
        if isCorrectUserName && isCorrectPhoneNumber {
            presenter.presentVerificationVC()
        }
    }
    
    func checkUserPhoneNumber(_ phoneNumber: String) {
//        guard !phoneNumber.isEmpty else { return }
        
        //FIXME: Логика проверки
        //MARK: Failed
        isCorrectPhoneNumber = false
        
        //MARK: Ok
        isCorrectPhoneNumber = true
        presenter.successfulPhoneNumberVerification(ResponseMessages.ok.rawValue)
        if isCorrectUserName && isCorrectPhoneNumber {
            presenter.presentVerificationVC()
        }
    }
}

