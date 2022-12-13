import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.layer.cornerRadius = avatarImage.bounds.width/2
            avatarImage.clipsToBounds = true
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.layer.borderWidth = 4.0
            avatarImage.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet weak var saveButtonOutlet: UIButton! {
        didSet {
            saveButtonOutlet.layer.cornerRadius = 15.0
        }
    }
    
    @IBOutlet weak var nickNameTFOutlet: UITextField!
    
    @IBOutlet weak var imageOfFlag: UIImageView! {
        didSet {
            imageOfFlag.layer.cornerRadius = imageOfFlag.bounds.width/2
            imageOfFlag.clipsToBounds = true
            imageOfFlag.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var bioTextViewOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func addPhotoButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: true)
    }
    
    @IBAction func nickNameTFAction(_ sender: UITextField) {
    }
    
    @IBAction func cityNameTFAction(_ sender: UITextField) {
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
    }
    
    @IBOutlet weak var bioTextViewAction: UITextView!
}
