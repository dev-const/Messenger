import Foundation

final class ProfileAssembly {
    
    static func buildModule() -> ProfileViewController {
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
    
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}
