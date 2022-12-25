import Foundation

//MARK: Protocol

protocol WelcomeViewOutputProtocol: AnyObject {
    
    var view: WelcomeViewInputProtocol? { get set }
    var router: WelcomeRouterInputProtocol! { get set }

    func viewDidLoad()
    func presentRegVC()
    func presentAuthVC()
}

//MARK: Presenter

final class WelcomePresenter: WelcomeViewOutputProtocol {
    
    weak var view: WelcomeViewInputProtocol?
    var router: WelcomeRouterInputProtocol!


    @objc
    func presentRegVC() {
        router.presentRegVC()
    }

    @objc
    func presentAuthVC() {
        router.presentAuthVC()
    }

    func viewDidLoad() {

    }
}
