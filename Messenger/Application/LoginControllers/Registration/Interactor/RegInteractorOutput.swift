import Foundation

protocol RegInteractorOutput: AnyObject {
    
    func didFCreateAccount()
    func didReceiveError(error: String)
}
