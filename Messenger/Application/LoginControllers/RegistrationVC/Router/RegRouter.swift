import Foundation

final class RegRouter: RegRouterInput {
    
    weak var view: RegistrationViewController!
    
    func showRegVC() {
        print("showRegVC")
    }
    
    func showAuthVC() {
        print("showAuthVC")
    }
}
