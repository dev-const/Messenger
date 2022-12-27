import Foundation

//MARK: Protocol

protocol EditProfileInteractorInputProtocol: AnyObject {
    var presenter: EditProfileInteractorOutputProtocol! { get }
}

//MARK: Interactor

final class EditProfileInteractor: EditProfileInteractorInputProtocol {
    
    weak var presenter: EditProfileInteractorOutputProtocol!
}


