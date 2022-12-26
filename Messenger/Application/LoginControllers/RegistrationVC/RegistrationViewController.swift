import UIKit

//MARK: Protocol

protocol RegViewInputProtocol: AnyObject {
    
    var presenter: RegViewOutputProtocol! { get }
    
    func didIncorrectUserNameLabel()
    func didIncorrectPhoneNumberLabel()
    func correctUserNameLabel()
    func correctPhoneNumberLabel()
    func presentErrorAlert()
    
    //MARK: UITextFieldDelegate

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
}

//MARK: ViewController

final class RegistrationViewController: UIViewController {
    
    var presenter: RegViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var promptLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Введите свои данные для получения доступа"
        label.textAlignment = .left
        return label
    }()
    
    private lazy var letterImageView: CustomImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 100))
        let imageView = CustomImageView(frame: frame)
        imageView.image = UIImage(named: "2-open-letter-envelope")
        return imageView
    }()
    
    private lazy var userNameTF: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Имя пользователя (max - 16 символов)"
        textField.textAlignment = .left
        textField.textContentType = .name
        textField.autocapitalizationType = .words
        textField.autocorrectionType = .yes
        textField.returnKeyType = .next
        textField.keyboardType = .default
        textField.alpha = 0
        return textField
    }()
    
    private lazy var incorrectUserNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Введены некорректные данные"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var phoneNumberTF: UITextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
        let textField = UITextField(frame: frame)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Номер телефона"
        textField.textAlignment = .left
        textField.returnKeyType = .done
        textField.textContentType = .telephoneNumber
        textField.keyboardType = .numberPad
        textField.alpha = 0
        return textField
    }()
    
    private lazy var incorrectPhoneNumberLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Введены некорректные данные"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var signInButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.blue, title: "Зарегистрироваться")
        return button
    }()
    
    private lazy var licenseAgreementLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Регистрируясь, вы соглашаетесь с условиями использования и политикой конфиденциальности, включая использование файлов cookie. Другие пользователи смогут найти вас по номеру телефона, если он предоставлен."
        label.textColor = .darkGray
        label.textAlignment = .left
        return label
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        userNameTF.delegate = self
        phoneNumberTF.delegate = self
        
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    @objc
    func signIn() {
        presenter.router.presentChatListVC()
    }
    
    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    //MARK: ViewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateForViewDidAppear()
    }
    
    //MARK: ViewWillDisappear

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animateForViewWillDisappear()
    }
}

//MARK: Extension - RegViewInputProtocol

extension RegistrationViewController: RegViewInputProtocol {
    
    func didIncorrectUserNameLabel() {
        incorrectUserNameLabel.isHidden = false
    }
    
    func didIncorrectPhoneNumberLabel() {
        incorrectPhoneNumberLabel.isHidden = false
    }
    
    func correctUserNameLabel() {
        incorrectUserNameLabel.isHidden = true
    }
    
    func correctPhoneNumberLabel() {
        incorrectPhoneNumberLabel.isHidden = true
    }
    
    func presentErrorAlert() {
        let alertVC = CustomAlert.createAlert(title: AlertMessages.failedToSendData.rawValue,
                                   message: AlertMessages.checkYourInternetConnection.rawValue,
                                   actionTitle: AlertMessages.ok.rawValue)
        self.present(alertVC, animated: true)
    }
}

//MARK: Extension - UITextFieldDelegate

extension RegistrationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTF {
            let fullString = (textField.text ?? "") + string
            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
            return true
        }
}

//MARK: Extension - Animate functions

extension RegistrationViewController {
    
    private func animateForViewDidAppear() {
        
        UIView.animate(withDuration: 0.3) {
            self.promptLabel.alpha = 1.0
            self.letterImageView.alpha = 1.0
        }
        UIView.animate(withDuration: 0.5) {
            self.userNameTF.alpha = 1.0
            self.incorrectUserNameLabel.alpha = 1.0
            self.incorrectPhoneNumberLabel.alpha = 1.0
            self.phoneNumberTF.alpha = 1.0
        }
        UIView.animate(withDuration: 0.7) {
            self.signInButton.alpha = 1.0
            self.licenseAgreementLabel.alpha = 1.0
        }
    }
    
    private func animateForViewWillDisappear() {
        
        UIView.animate(withDuration: 0.7) {
            self.promptLabel.alpha = 0
            self.letterImageView.alpha = 0
        }
        UIView.animate(withDuration: 0.5) {
            self.userNameTF.alpha = 0
            self.incorrectUserNameLabel.alpha = 0
            self.incorrectPhoneNumberLabel.alpha = 0
            self.phoneNumberTF.alpha = 0
        }
        UIView.animate(withDuration: 0.4) {
            self.signInButton.alpha = 0
            self.licenseAgreementLabel.alpha = 0
        }
    }
}

//MARK: Extension - Create constraints

extension RegistrationViewController {
    
    private func setConstraints() {
        
        view.addSubview(promptLabel)
        view.addSubview(letterImageView)
        view.addSubview(userNameTF)
        view.addSubview(incorrectUserNameLabel)
        view.addSubview(phoneNumberTF)
        view.addSubview(incorrectPhoneNumberLabel)
        view.addSubview(signInButton)
        view.addSubview(licenseAgreementLabel)
        
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        letterImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        licenseAgreementLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            letterImageView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            letterImageView.widthAnchor.constraint(equalToConstant: 200),
            letterImageView.heightAnchor.constraint(equalToConstant: 200),
            letterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userNameTF.topAnchor.constraint(equalTo: letterImageView.bottomAnchor, constant: 20),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            incorrectUserNameLabel.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 2),
            incorrectUserNameLabel.leadingAnchor.constraint(equalTo: userNameTF.leadingAnchor),
            
            phoneNumberTF.topAnchor.constraint(equalTo: incorrectUserNameLabel.bottomAnchor, constant: 5),
            phoneNumberTF.leadingAnchor.constraint(equalTo: incorrectUserNameLabel.leadingAnchor),
            phoneNumberTF.trailingAnchor.constraint(equalTo: userNameTF.trailingAnchor),
            
            incorrectPhoneNumberLabel.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 2),
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
