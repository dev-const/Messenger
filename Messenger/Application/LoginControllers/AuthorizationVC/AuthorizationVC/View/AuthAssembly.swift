import Foundation

final class AuthAssembly {
    
    static func build() {
        let viewController = AuthorizationViewController()
        let router = AuthRouter()
        let presenter = AuthPresenter()
        let interactor = AuthInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        presenter.interactor = interactor
        
    }
}
