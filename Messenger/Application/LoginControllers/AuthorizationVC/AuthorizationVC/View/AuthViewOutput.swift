import Foundation

protocol AuthViewOutput: AnyObject {
    var view: AuthViewInput! { get }
    
    func closeSelfVC()
    func openNextVC()
}
