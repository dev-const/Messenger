import UIKit

//MARK: EditProfileViewInputProtocol

protocol EditProfileViewInputProtocol: AnyObject {
    var presenter: EditProfileViewOutputProtocol! { get }
}

//MARK: EditProfileViewController

final class EditProfileViewController: UIViewController, UINavigationControllerDelegate {
    
    var presenter: EditProfileViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    
    private lazy var backButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 60, height: 60))
        let button = UIButton(frame: frame)
        let image = UIImage(systemName: "arrowshape.backward")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    private lazy var topView: UIView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 130))
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(named: CustomColor.BlueLight.rawValue)
        return  view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 180, height: 180))
        let imageView = UIImageView(frame: frame)
        imageView.layer.cornerRadius = imageView.bounds.height/2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: CustomColor.BlueLight.rawValue)
        imageView.image = UIImage(systemName: "person.badge.plus")
        return imageView
    }()
    
    private lazy var saveButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.blue, title: "Сохранить")
        return button
    }()
    
    private lazy var changePhotoButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 55, height: 25))
        let button = UIButton(frame: frame)
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = UIFont(name: CustomFont.RobotoBlack.rawValue, size: 14)
        button.setTitleColor(UIColor(named: CustomColor.Blue.rawValue), for: .normal)
        button.layer.cornerRadius = button.bounds.height/2
        button.backgroundColor = .white
        button.alpha = 0.4
        return button
    }()
    
    private lazy var nickNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoMedium.rawValue, fontSize: 18, numberOfLines: 1)
        label.textColor = .black
        label.text = "Никнейм"
        return label
    }()
    
    private lazy var nickNameTextField: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.autocapitalizationType = .words
        textField.borderStyle = .roundedRect
        textField.placeholder = "Никнейм (не более 16 символов)"
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.textContentType = .name
        textField.returnKeyType = .done
        textField.font = UIFont(name: CustomFont.RobotoRegular.rawValue, size: 16)
        return textField
    }()
    
    private lazy var cityNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoMedium.rawValue, fontSize: 18, numberOfLines: 1)
        label.textColor = .black
        label.text = "Город"
        return label
    }()
    
    private lazy var cityNameTextField: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.autocapitalizationType = .words
        textField.borderStyle = .roundedRect
        textField.placeholder = "Город"
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.textContentType = .name
        textField.returnKeyType = .done
        textField.font = UIFont(name: CustomFont.RobotoRegular.rawValue, size: 16)
        return textField
    }()
    
    private lazy var dateOfBirthNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoMedium.rawValue, fontSize: 18, numberOfLines: 1)
        label.textColor = .black
        label.text = "Дата рождения"
        return label
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 35))
        let datePicker = UIDatePicker(frame: frame)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .compact
        }
        datePicker.locale = Locale(identifier: "ru")
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        return datePicker
    }()
    
    private lazy var bioTextView: UITextView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let textView = UITextView(frame: frame)
        textView.isEditable = true
        textView.isScrollEnabled = true
        textView.contentMode = .left
        textView.showsVerticalScrollIndicator = false
        textView.returnKeyType = .default
        textView.keyboardType = .default
        textView.layer.borderColor = UIColor(named: CustomColor.BlueLight.rawValue)?.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.textContentType = .name
        textView.font = UIFont(name: CustomFont.RobotoLight.rawValue, size: 16)
        textView.text = "О себе (не более 160 символов) Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        return textView
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        createNotifications()
        nickNameTextField.delegate = self
        cityNameTextField.delegate = self
        bioTextView.delegate = self
        imagePicker.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        changePhotoButton.addTarget(self, action: #selector(changePhotoButtonPressed), for: .touchUpInside)
        
    }
    
    //MARK: Functions for target
    
    @objc
    private func backButtonPressed() {
        print("Back button did pressed")
    }
    
    @objc
    private func changePhotoButtonPressed() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc
    private func saveButtonPressed() {
        print("Save button did pressed")
    }
    
    //MARK: Settings keyboard
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    //FIXME: for only textView
    
    private func createNotifications() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name:  UITextView.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name:  UITextView.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: UITextView.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UITextView.keyboardWillHideNotification,
                                                  object: nil)
    }
}

//MARK: UITextFieldDelegate

extension EditProfileViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nickNameTextField || textField == cityNameTextField {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
}

//MARK: Extension - ImagePickerDelegate

extension EditProfileViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        avatarImageView.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}

//MARK: UITextViewDelegate

extension EditProfileViewController: UITextViewDelegate{
    
}

//MARK: Extension - EditProfileViewInputProtocol

extension EditProfileViewController: EditProfileViewInputProtocol {
    
}

//MARK: Extension - Create constraints

extension EditProfileViewController {
    
    private func setConstraints() {
        
        view.addSubview(topView)
        view.addSubview(backButton)
        view.addSubview(avatarImageView)
        view.addSubview(saveButton)
        view.addSubview(changePhotoButton)
        view.addSubview(nickNameLabel)
        view.addSubview(nickNameTextField)
        view.addSubview(cityNameLabel)
        view.addSubview(cityNameTextField)
        view.addSubview(dateOfBirthNameLabel)
        view.addSubview(datePicker)
        view.addSubview(bioTextView)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        nickNameTextField.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthNameLabel.translatesAutoresizingMaskIntoConstraints = false
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalToConstant: 130),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 180),
            avatarImageView.widthAnchor.constraint(equalToConstant: 180),
            avatarImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: avatarImageView.bounds.height/2),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            
            backButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 60),
            backButton.widthAnchor.constraint(equalToConstant: 60),
            backButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            saveButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            changePhotoButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -10),
            changePhotoButton.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            changePhotoButton.heightAnchor.constraint(equalToConstant: 25),
            changePhotoButton.widthAnchor.constraint(equalToConstant: 55),
            
            nickNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 24),
            nickNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            nickNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            nickNameTextField.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 8),
            nickNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            nickNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            cityNameLabel.topAnchor.constraint(equalTo: nickNameTextField.bottomAnchor, constant: 24),
            cityNameLabel.leadingAnchor.constraint(equalTo: nickNameTextField.leadingAnchor),
            cityNameLabel.trailingAnchor.constraint(equalTo: nickNameTextField.trailingAnchor),
            
            cityNameTextField.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 24),
            cityNameTextField.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            cityNameTextField.trailingAnchor.constraint(equalTo: cityNameLabel.trailingAnchor),
            
            dateOfBirthNameLabel.topAnchor.constraint(equalTo: cityNameTextField.bottomAnchor, constant: 24),
            dateOfBirthNameLabel.leadingAnchor.constraint(equalTo: cityNameTextField.leadingAnchor),
            dateOfBirthNameLabel.trailingAnchor.constraint(equalTo: cityNameTextField.trailingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: dateOfBirthNameLabel.topAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            datePicker.heightAnchor.constraint(equalToConstant: 35),
            
            bioTextView.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 24),
            bioTextView.leadingAnchor.constraint(equalTo: dateOfBirthNameLabel.leadingAnchor),
            bioTextView.trailingAnchor.constraint(equalTo: datePicker.trailingAnchor),
            bioTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
