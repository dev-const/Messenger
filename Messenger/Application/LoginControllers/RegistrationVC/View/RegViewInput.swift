import UIKit

protocol RegViewInput: AnyObject {
    
    var output: RegViewOutput! { get }
    
    //MARK: UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
}
