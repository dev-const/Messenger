import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var signUpButtonOutlet: UIButton! {
        didSet {
            signUpButtonOutlet.layer.cornerRadius = 15.0
        }
    }
    
    @IBOutlet weak var logInButtonOutlet: UIButton! {
        didSet {
            logInButtonOutlet.layer.cornerRadius = 15.0
            logInButtonOutlet.layer.borderWidth = 1.0
            logInButtonOutlet.layer.borderColor = UIColor(named: "CustomBlue")?.cgColor
            logInButtonOutlet.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {

    }

    @IBAction func logInButtonAction(_ sender: UIButton) {
        
    }

}

    
    


