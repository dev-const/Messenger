import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var userNameTFOutlet: UITextField!
    
    @IBOutlet weak var imageOfFlag: UIImageView! {
        didSet {
            imageOfFlag.layer.cornerRadius = 10.0
            imageOfFlag.clipsToBounds = true
            imageOfFlag.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var phoneNumberTFOutlet: UITextField!
    
    
    @IBOutlet weak var getCodeButtonOutlet: UIButton! {
        didSet {
            getCodeButtonOutlet.layer.cornerRadius = 15.0
            getCodeButtonOutlet.layer.borderWidth = 1.0
            getCodeButtonOutlet.layer.borderColor = UIColor(named: "CustomBlue")?.cgColor
            getCodeButtonOutlet.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var codeTFOutlet: UITextField!
    
    @IBOutlet weak var logInButtonOutlet: UIButton! {
        didSet {
            self.logInButtonOutlet.layer.cornerRadius = 15.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func userNameTFAction(_ sender: UITextField) {
    }
    
    @IBAction func phoneNumberTFAction(_ sender: UITextField) {
    }
    
    @IBAction func getCodeButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func codeTFAction(_ sender: UITextField) {
    }
    
    @IBAction func logInButtonAction(_ sender: UIButton) {
    }
}
