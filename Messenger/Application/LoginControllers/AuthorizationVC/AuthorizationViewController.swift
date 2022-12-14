import UIKit

final class AuthorizationViewController: UIViewController {

    //MARK: Create UI objects
    
    private let closeButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        let button = UIButton(frame: frame)
        let image = UIImage(systemName: "xmark")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: CustomColor.Blue.rawValue)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    private let promptLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Введите свои данные для входа в учетную запись"
        return label
    }()
    
    private let userNameTF: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Имя пользователя"
        textField.textAlignment = .left
        textField.textContentType = .name
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .yes
        textField.returnKeyType = .next
        textField.keyboardType = .phonePad
        return textField
    }()
    
    private let incorrectUserNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Введены некорректные данные"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = false
        return label
    }()
    
    private let phoneNumberTF: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Номер телефона"
        textField.textAlignment = .left
        textField.returnKeyType = .done
        textField.textContentType = .telephoneNumber
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let incorrectPhoneNumberLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Введены некорректные данные"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = false
        return label
    }()
    
    private let nextButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.white, title: "Далее")
        return button
    }()
    
    //MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createConstraints()
        phoneNumberTF.delegate = self
        userNameTF.delegate = self
    }

}


//MARK: UITextFieldDelegate

extension AuthorizationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
}

//MARK: Create constraints

extension AuthorizationViewController {
    
    private func createConstraints() {
        
        view.addSubview(closeButton)
        view.addSubview(promptLabel)
        view.addSubview(userNameTF)
        view.addSubview(incorrectUserNameLabel)
        view.addSubview(phoneNumberTF)
        view.addSubview(incorrectPhoneNumberLabel)
        view.addSubview(nextButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            promptLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -30),
            
            userNameTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userNameTF.leadingAnchor.constraint(equalTo: promptLabel.leadingAnchor),
            userNameTF.trailingAnchor.constraint(equalTo: closeButton.trailingAnchor),
            
            incorrectUserNameLabel.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 2),
            incorrectUserNameLabel.leadingAnchor.constraint(equalTo: userNameTF.leadingAnchor),
            incorrectUserNameLabel.trailingAnchor.constraint(equalTo: userNameTF.trailingAnchor),
            
            phoneNumberTF.topAnchor.constraint(equalTo: incorrectUserNameLabel.bottomAnchor, constant: 5),
            phoneNumberTF.leadingAnchor.constraint(equalTo: incorrectUserNameLabel.leadingAnchor),
            phoneNumberTF.trailingAnchor.constraint(equalTo: incorrectUserNameLabel.trailingAnchor),
            
            incorrectPhoneNumberLabel.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 0),
            incorrectPhoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberTF.leadingAnchor),
            incorrectPhoneNumberLabel.trailingAnchor.constraint(equalTo: phoneNumberTF.trailingAnchor),
            
            nextButton.topAnchor.constraint(equalTo: incorrectPhoneNumberLabel.bottomAnchor, constant: 35),
            nextButton.leadingAnchor.constraint(equalTo: incorrectPhoneNumberLabel.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: incorrectPhoneNumberLabel.trailingAnchor)
        ])
    }
}
