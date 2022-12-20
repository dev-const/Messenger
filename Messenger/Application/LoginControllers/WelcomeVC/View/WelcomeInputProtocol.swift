import Foundation

protocol WelcomeViewInputProtocol: AnyObject {
    
    var presenter: WelcomeViewOutputProtocol! { get }
    
    func openRegVC()
    
    func openAuthVC()
}
