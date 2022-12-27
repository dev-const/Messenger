import Foundation

//MARK: Protocol

protocol ProfileRouterInputProtocol: AnyObject {
    var view: ProfileViewController? { get }
    func showEditProfileVC()
}

//MARK: Router

final class ProfileRouter: ProfileRouterInputProtocol {
    weak var view: ProfileViewController?
    func showEditProfileVC() {
        self.view?.navigationController?.present(EditProfileAssembly.buildModule(), animated: true)
    }
}
