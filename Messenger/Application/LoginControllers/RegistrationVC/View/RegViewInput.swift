import UIKit

protocol RegViewInput: AnyObject {
    
    func hideKeyboard()
    
    //MARK: UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
}
