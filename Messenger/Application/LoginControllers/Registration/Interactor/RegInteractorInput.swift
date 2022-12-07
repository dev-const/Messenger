import Foundation

protocol RegInteractorInput: AnyObject {
    
    var output: RegInteractorOutput! { get }
    
    func sendUserInfo()
    func changeStatusIsLogin(status: Bool)
}
