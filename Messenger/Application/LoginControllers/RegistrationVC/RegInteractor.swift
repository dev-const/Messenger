import Foundation

//MARK: Protocol

protocol RegInteractorInputProtocol: AnyObject {
    
    var presenter: RegInteractorOutputProtocol? { get }
    
    func obtainFormattedString(_ string: String)
    func sendUserInfo()
    func changeStatusIsLogin(status: Bool)
}

//MARK: Interactor

final class RegInteractor {    
    
    weak var presenter: RegInteractorOutputProtocol?
    
    func sendUserInfo() {
        
    }
}


//MARK: RegInteractorInputProtocol

extension RegInteractor: RegInteractorInputProtocol {
    func obtainFormattedString(_ string: String) {

     }
    
    func changeStatusIsLogin(status: Bool) {
        UserDefaults().set(true, forKey: "isLogin")
    }
}
