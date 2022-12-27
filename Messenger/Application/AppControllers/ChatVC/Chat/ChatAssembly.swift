import Foundation

final class ChatAssembly {
    
    static func buildModule() -> ChatViewController {
        let viewController = ChatViewController()
        let presenter = ChatPresenter()
        let router = ChatRouter()
        let interactor = ChatInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}

