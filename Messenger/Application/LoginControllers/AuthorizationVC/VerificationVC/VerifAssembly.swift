import Foundation

final class VerifAssembly {

    static func buildModule() -> VerificationViewController {
        let viewController = VerificationViewController()
        let presenter = VerifPresenter()
        let interactor = VerifInteractor()
        let router = VerifRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}

