import UIKit

final class RegistrationViewController: UIViewController, RegViewInput {
    
    var output: RegViewOutput!
    
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
        label.text = "Введите свои данные для получения доступа"
        label.textAlignment = .left
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
        label.isHidden = true
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
        label.isHidden = true
        return label
    }()
    
    private let signInButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.blue, title: "Зарегистрироваться")
        return button
    }()
    
    private let licenseAgreementLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Регистрируясь, вы соглашаетесь с условиями использования и политикой конфиденциальности, включая использование файлов cookie. Другие пользователи смогут найти вас по номеру телефона, если он предоставлен."
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        createConstraints()
        view.backgroundColor = .white
        userNameTF.delegate = self
        phoneNumberTF.delegate = self
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

//MARK: Create constraints

extension RegistrationViewController {
    
    private func createConstraints() {
        
        view.addSubview(closeButton)
        view.addSubview(promptLabel)
        view.addSubview(userNameTF)
        view.addSubview(incorrectUserNameLabel)
        view.addSubview(phoneNumberTF)
        view.addSubview(incorrectPhoneNumberLabel)
        view.addSubview(signInButton)
        view.addSubview(licenseAgreementLabel)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        licenseAgreementLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            promptLabel.topAnchor.constraint(equalTo: closeButton.topAnchor),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            promptLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -30),
            
            userNameTF.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 140),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            incorrectUserNameLabel.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 0),
            incorrectUserNameLabel.leadingAnchor.constraint(equalTo: userNameTF.leadingAnchor),
            
            phoneNumberTF.topAnchor.constraint(equalTo: incorrectUserNameLabel.bottomAnchor, constant: 5),
            phoneNumberTF.leadingAnchor.constraint(equalTo: incorrectUserNameLabel.leadingAnchor),
            phoneNumberTF.trailingAnchor.constraint(equalTo: userNameTF.trailingAnchor),
            
            incorrectPhoneNumberLabel.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 0),
            incorrectPhoneNumberLabel.leadingAnchor.constraint(equalTo: phoneNumberTF.leadingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: incorrectPhoneNumberLabel.bottomAnchor, constant: 35),
            signInButton.leadingAnchor.constraint(equalTo: incorrectPhoneNumberLabel.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: phoneNumberTF.trailingAnchor),
            
            licenseAgreementLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            licenseAgreementLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            licenseAgreementLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}
