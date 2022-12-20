import Foundation

final class WelcomeViewPresenter: WelcomeViewOutputProtocol {
    
    weak private var view: WelcomeViewInputProtocol!
    private var router: WelcomeRouterInputProtocol!
    
    @objc func openRegVC() {
        view.openRegVC()
    }
    
    @objc func openAuthVC() {
        view.openAuthVC()
    }
}
