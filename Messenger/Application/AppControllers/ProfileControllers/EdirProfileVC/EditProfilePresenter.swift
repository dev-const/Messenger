import Foundation

//MARK: Protocols

protocol EditProfileViewOutputProtocol: AnyObject {
    
    var view: EditProfileViewInputProtocol? { get }
    var router: EditProfileRouterInputProtocol! { get }
}

protocol EditProfileInteractorOutputProtocol: AnyObject {
    
    var interactor: EditProfileInteractorInputProtocol! { get }
}

//MARK: Presenter

final class EditProfilePresenter {
    weak var view: EditProfileViewInputProtocol?
    var router: EditProfileRouterInputProtocol!
    var interactor: EditProfileInteractorInputProtocol!
}

//MARK: Extension - EditProfileViewOutputProtocol

extension EditProfilePresenter: EditProfileViewOutputProtocol {
    
}

//MARK: Extension - EditProfileInteractorOutputProtocol

extension EditProfilePresenter: EditProfileInteractorOutputProtocol {
    
}
