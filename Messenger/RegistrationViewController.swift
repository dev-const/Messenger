import UIKit

class RegistrationViewController: UIViewController {

    
    @IBOutlet weak var userNameTFOutlet: UITextField!
    
    @IBOutlet weak var phoneNumberTFOutlet: UITextField!
    
    @IBOutlet weak var signUpButtonOutlet: UIButton! {
        didSet {
            signUpButtonOutlet.layer.cornerRadius = 15.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func userNameTFAction(_ sender: UITextField) {
        
    }
    
    @IBAction func phoneNumberTFAction(_ sender: UITextField) {
        
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        
    }
    
    
}


