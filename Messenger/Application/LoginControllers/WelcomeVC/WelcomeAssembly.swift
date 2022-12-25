import UIKit

final class WelcomeAssembly {
    
    static func build() -> WelcomeViewController {
        let viewController = WelcomeViewController()
        let router = WelcomeRouter()
        let presenter = WelcomePresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        
        return viewController
    }
}
