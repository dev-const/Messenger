import Foundation

final class EditProfileAssembly {
    
    static func buildModule() -> EditProfileViewController {
        let viewController = EditProfileViewController()
        let presenter = EditProfilePresenter()
        let router = EditProfileRouter()
        let interactor = EditProfileInteractor()
    
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}

