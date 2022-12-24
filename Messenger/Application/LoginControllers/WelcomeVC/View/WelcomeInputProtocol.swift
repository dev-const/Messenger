import Foundation

protocol WelcomeViewInputProtocol: AnyObject {
    
    var output: WelcomeViewOutputProtocol! { get }
    
    func openRegVC()
    func openAuthVC()
}
