import Foundation

//MARK: Interactor

protocol VerifInteractorInputProtocol: AnyObject {
    
    var presenter: VerifInteractorOutputProtocol? { get }
    func checkCode(_ code: String)
}


//MARK: Interactor

final class VerifInteractor: VerifInteractorInputProtocol {
    
    weak var presenter: VerifInteractorOutputProtocol?
    
    private var isCorrectCode = false  /* false - on default */
    private let testCode = "133337"
    
    func checkCode(_ code: String) {
        guard !code.isEmpty else { return }
        
        if code == testCode {
            isCorrectCode = true
            UserDefaults.standard.set(true, forKey: "isSignIn")
            print("Status value - isSignIn changed to true")
//            UserDefaults.setValue(true, forKey: "isSignIn")
            presenter?.sendCodeAnswer(ResponseMessages.rightCode.rawValue)
        } else {
            isCorrectCode = false
            presenter?.sendCodeAnswer(ResponseMessages.wrongCode.rawValue)
        }
    }
}
