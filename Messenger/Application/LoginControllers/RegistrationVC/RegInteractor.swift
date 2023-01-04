import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

//MARK: Protocol

protocol RegInteractorInputProtocol: AnyObject {
    
    var presenter: RegInteractorOutputProtocol? { get }
    
    func obtainFormattedString(_ string: String)
    func changeStatusIsSignIn(status: Bool)
    func checkValidate(_ userName: String?, _ phoneNumber: String?)
}

//MARK: Interactor

final class RegInteractor: RegInteractorInputProtocol {
    
    func checkValidate(_ userName: String?, _ phoneNumber: String?) {
        
        if userName == nil || userName == "" {
            presenter?.didIncorrectUserNameLabel()
        }
        if phoneNumber == nil || phoneNumber == "" {
            presenter?.didIncorrectPhoneNumberLabel()
        }
        
        presenter?.presentChatListVC()
    }
    
    weak var presenter: RegInteractorOutputProtocol?
    
    func obtainFormattedString(_ string: String) {
        
    }
    
    func changeStatusIsSignIn(status: Bool) {
        func changeStatusIsSignIn(status: Bool) {
            UserDefaults().set(true, forKey: "isSignIn")
        }
    }
}
