import Foundation

//MARK: Protocol

protocol WelcomeViewOutputProtocol: AnyObject {
    
    var view: WelcomeViewInputProtocol? { get set }
    var router: WelcomeRouterInputProtocol! { get set }

    func presentRegVC()
    func presentAuthVC()
}

//MARK: Presenter

final class WelcomePresenter: WelcomeViewOutputProtocol {
    
    weak var view: WelcomeViewInputProtocol?
    var router: WelcomeRouterInputProtocol!


    func presentRegVC() {
        router.pushRegVC()
    }

    func presentAuthVC() {
        router.pushAuthVC()
    }
}
