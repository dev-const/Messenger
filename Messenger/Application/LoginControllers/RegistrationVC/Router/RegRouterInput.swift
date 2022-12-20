import Foundation

protocol RegRouterInput: AnyObject {
    
    var view: RegistrationViewController! { get }
    func showNextVC()
}
