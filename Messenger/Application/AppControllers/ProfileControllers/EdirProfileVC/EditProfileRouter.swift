import Foundation

//MARK: Protocol

protocol EditProfileRouterInputProtocol: AnyObject {
    var view: EditProfileViewController? { get }
    func showProfileVC()
}

//MARK: Router

final class EditProfileRouter: EditProfileRouterInputProtocol {
    weak var view: EditProfileViewController?
    func showProfileVC() {
        self.view?.navigationController?.dismiss(animated: true)
    }
}

