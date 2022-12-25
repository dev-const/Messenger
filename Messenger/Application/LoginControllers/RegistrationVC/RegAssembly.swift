import UIKit

final class RegAssembly {
    
    static func build() -> RegistrationViewController {
        let viewController = RegistrationViewController()
        let router = RegRouter()
        let presenter = RegPresenter()
        let interactor = RegInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        return viewController
    }
}

