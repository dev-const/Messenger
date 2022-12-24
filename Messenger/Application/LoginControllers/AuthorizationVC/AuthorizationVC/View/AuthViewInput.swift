import Foundation

protocol AuthViewInput: AnyObject {
    var output: AuthViewOutput! { get }
    
    func closeSelfVC()
    func openNextVC()
}
