import Foundation

final class RegInteractor {    
    
    weak var output: RegInteractorOutput!
    
    func sendUserInfo() {
        
    }
}


extension RegInteractor: RegInteractorInput {
    func changeStatusIsLogin(status: Bool) {
        UserDefaults().set(true, forKey: "isLogin")
    }
}
