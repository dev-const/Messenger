import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.layer.cornerRadius = 59.0
            avatarImage.clipsToBounds = true
            avatarImage.layer.borderWidth = 4.0
            avatarImage.layer.borderColor = UIColor.white.cgColor
            avatarImage.clipsToBounds = true
            avatarImage.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var editButtonOutlet: UIButton! {
        didSet {
            editButtonOutlet.layer.cornerRadius = 15.0
            editButtonOutlet.layer.borderWidth = 1.0
            editButtonOutlet.layer.borderColor = UIColor(named: "CustomBlue")?.cgColor
            editButtonOutlet.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var nickName: UILabel!
    
    @IBOutlet weak var imageOfFlag: UIImageView! {
        didSet {
            imageOfFlag.layer.cornerRadius = 10.0
            imageOfFlag.clipsToBounds = true
            imageOfFlag.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var dateOfBirth: UILabel!
    
    @IBOutlet weak var zodiacSign: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func editButtonAction(_ sender: UIButton) {
        
    }
    
    
    
    
}
