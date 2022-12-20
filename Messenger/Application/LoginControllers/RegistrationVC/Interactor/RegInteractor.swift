import Foundation

final class RegInteractor {    
    
    weak var output: RegInteractorOutput!
    
    func sendUserInfo() {
        
    }
}


extension RegInteractor: RegInteractorInput {
    func obtainFormattedString(_ string: String) {

     }
    
    func changeStatusIsLogin(status: Bool) {
        UserDefaults().set(true, forKey: "isLogin")
    }
}
