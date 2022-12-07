import UIKit

final class RegistrationViewController: UIViewController, RegViewInput {

    var output: RegViewOutput!

    
    @IBOutlet weak var userNameTFOutlet: UITextField!
    
    @IBOutlet weak var phoneNumberTFOutlet: UITextField!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton! {
        didSet {
            signUpButtonOutlet.layer.cornerRadius = 15.0
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTFOutlet.delegate = self
        phoneNumberTFOutlet.delegate = self
        
    }
    
    @IBAction func closeSelfVC(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func userNameTFAction(_ sender: UITextField) {
        
    }
    
    @IBAction func phoneNumberTFAction(_ sender: UITextField) {
        
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        output.userSelectedCreateAccount(userName: userNameTFOutlet.text ?? "", phoneNumber: phoneNumberTFOutlet.text ?? "")
    }
}

//MARK: UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
}
