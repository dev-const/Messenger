import UIKit

protocol WelcomeViewOutputProtocol: AnyObject {
    
    var view: WelcomeViewInputProtocol! { get }
    
    func openRegVC()
    func openAuthVC()
}
