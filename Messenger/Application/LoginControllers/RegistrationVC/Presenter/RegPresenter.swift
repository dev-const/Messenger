import Foundation

final class RegPresenter {

    private weak var view: RegViewInput!
    private var regInteractor: RegInteractorInput!
    private var router: RegRouterInput!
    
    //MARK: ViewOutput
    
    func signUpButtonAction() {
        
    }
    
    //MARK: InteractorOutput
    
    func didFinish() {
//        view.
    }
}

//MARK: RegViewOutput

extension RegPresenter: RegViewOutput {
    func userSelectedCreateAccount(userName: String, phoneNumber: String) {

    }
}

//MARK: RegInteractorOutput

extension RegPresenter: RegInteractorOutput {
    
    func didFCreateAccount() {
//        router.openAuthScreen()
    }
    
    func didReceiveError(error: String) {
        
    }
}

//MARK: Check validate userName and userPhoneNumber

extension RegPresenter {
    
    func validatePhoneNumber( _ phoneNumber: String) -> Bool {

        guard !phoneNumber.isEmpty else { return false}

        if phoneNumber.count < 11 {
                return false
            }


            return true
    }
    
    func validateUserName(_ userName: String) -> Bool {

        guard !userName.isEmpty else { return false}



            return true
    }
}
