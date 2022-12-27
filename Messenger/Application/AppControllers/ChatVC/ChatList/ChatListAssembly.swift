import Foundation

final class ChatListAssembly {
    
    static func buildModule() -> ChatListViewController {
        let viewController = ChatListViewController()
        let presenter = ChatListPresenter()
        let router = ChatListRouter()
        let interactor = ChatListInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
}
