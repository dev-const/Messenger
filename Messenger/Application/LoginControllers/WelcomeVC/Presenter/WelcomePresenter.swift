import UIKit

final class WelcomeViewPresenter: WelcomeViewOutputProtocol {
    
    weak var view: WelcomeViewInputProtocol!
    var router: WelcomeRouterInputProtocol!
    
    @objc func openNextVC(_ viewController: UIViewController) {
        router.openNextVC(viewController)
    }

}
