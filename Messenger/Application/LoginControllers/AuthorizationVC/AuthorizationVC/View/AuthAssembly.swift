import Foundation

final class AuthAssembly {

    static func buildModule() -> AuthorizationViewController {
        let viewController = AuthorizationViewController()
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        let router = AuthRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}

