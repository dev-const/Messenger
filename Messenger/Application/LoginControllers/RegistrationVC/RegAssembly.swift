import Foundation

final class RegAssembly {

    static func buildModule() -> RegistrationViewController {
        let viewController = RegistrationViewController()
        let presenter = RegPresenter()
        let interactor = RegInteractor()
        let router = RegRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}
