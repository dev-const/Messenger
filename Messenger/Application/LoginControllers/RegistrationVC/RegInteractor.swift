import Foundation

//MARK: Protocol

protocol RegInteractorInputProtocol: AnyObject {
    
    var presenter: RegInteractorOutputProtocol? { get }
    
    func obtainFormattedString(_ string: String)
    func changeStatusIsSignIn(status: Bool)
}

//MARK: Interactor

final class RegInteractor: RegInteractorInputProtocol {
    
    weak var presenter: RegInteractorOutputProtocol?

    func obtainFormattedString(_ string: String) {
        
    }
    
    func changeStatusIsSignIn(status: Bool) {
        func changeStatusIsSignIn(status: Bool) {
            UserDefaults().set(true, forKey: "isSignIn")
        }
    }
}
