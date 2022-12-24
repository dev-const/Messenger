import UIKit

final class WelcomePresenter: WelcomeViewOutputProtocol {
    
    weak var view: WelcomeViewInputProtocol!
    var router: WelcomeRouterInputProtocol!
    
    @objc func openRegVC() {
        router.openNextVC()
    }
    
    @objc func openAuthVC() {
        router.openNextVC()
    }

}
