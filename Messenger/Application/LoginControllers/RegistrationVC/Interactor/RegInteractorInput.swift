import Foundation

protocol RegInteractorInput: AnyObject {
    
    var output: RegInteractorOutput! { get }
    
    func obtainFormattedString(_ string: String)
    func sendUserInfo()
    func changeStatusIsLogin(status: Bool)
}
