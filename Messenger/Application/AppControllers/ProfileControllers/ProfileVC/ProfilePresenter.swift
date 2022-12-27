import Foundation

//MARK: Protocols

protocol ProfileViewOutputProtocol: AnyObject {
    
    var view: ProfileViewInputProtocol? { get }
    var router: ProfileRouterInputProtocol! { get }
}

//MARK: Presenter

final class ProfilePresenter {
    weak var view: ProfileViewInputProtocol?
    var router: ProfileRouterInputProtocol!
}

//MARK: Extension - ProfileViewOutputProtocol

extension ProfilePresenter: ProfileViewOutputProtocol {
    
}
