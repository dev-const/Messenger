import Foundation

protocol AuthViewOutputProtocol: AnyObject {
    var view: AuthViewInputProtocol! { get }
    
    func closeSelfVC()
    func openNextVC()
}
