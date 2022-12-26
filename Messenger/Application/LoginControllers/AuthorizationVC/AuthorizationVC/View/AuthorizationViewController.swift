import UIKit

//MARK: Protocol

protocol AuthViewInputProtocol: AnyObject {
    
    var presenter: AuthViewOutputProtocol! { get }
    
    func didIncorrectUserNameLabel()
    func didIncorrectPhoneNumberLabel()
    func correctUserNameLabel()
    func correctPhoneNumberLabel()
    func presentErrorAlert()
    func authorizationIsDone()
}

//MARK: ViewController

final class AuthorizationViewController: UIViewController {
    
    var presenter: AuthViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var promptLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Введите свои данные для входа в учетную запись"
        return label
    }()
    
    private lazy var letterImageView: CustomImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 100))
        let imageView = CustomImageView(frame: frame)
        imageView.image = UIImage(named: "3-envelope-in-the-air")
        return imageView
    }()
    
    private lazy var userNameTF: UITextField = {
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
    
    private lazy var nextButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.white, title: "Далее")
        return button
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        phoneNumberTF.delegate = self
        userNameTF.delegate = self
        nextButton.addTarget(self, action: #selector(sendToCheckUserInfo),
                             for: .touchUpInside)
    }
    
    @objc
    func sendToCheckUserInfo() {
        presenter.sendToCheckUserInfo(userName: userNameTF.text ?? "",
                                      phoneNumber: phoneNumberTF.text ?? "")
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

//MARK: Extension - AuthViewInputProtocol

extension AuthorizationViewController: AuthViewInputProtocol {
    
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
        let alertVC = CustomAlert.createAlert(title: AlertMessages.failedToCheckData.rawValue,
                                message: AlertMessages.checkYourInternetConnection.rawValue,
                                actionTitle: AlertMessages.ok.rawValue)
        self.present(alertVC, animated: true)
    }
    
    func authorizationIsDone() {
//        presenter.
    }  
}
 
//MARK: Extension - Animate functions

extension AuthorizationViewController {
    
    private func animateForViewDidAppear() {
        
        UIView.animate(withDuration: 0.3) {
            self.promptLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 0.5) {
            self.userNameTF.alpha = 1.0
            self.incorrectUserNameLabel.alpha = 1.0
            self.incorrectPhoneNumberLabel.alpha = 1.0
            self.phoneNumberTF.alpha = 1.0
        }
        UIView.animate(withDuration: 0.7) {
            self.nextButton.alpha = 1.0
            self.letterImageView.alpha = 1.0
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
        UIView.animate(withDuration: 0.3) {
            self.nextButton.alpha = 0
        }
    }
}

//MARK: Extension - UITextFieldDelegate

extension AuthorizationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == phoneNumberTF {
            let fullString = (textField.text ?? "") + string
            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Extension - Create constraints

extension AuthorizationViewController {
    
    private func setConstraints() {
        
        view.addSubview(promptLabel)
        view.addSubview(letterImageView)
        view.addSubview(userNameTF)
        view.addSubview(incorrectUserNameLabel)
        view.addSubview(phoneNumberTF)
        view.addSubview(incorrectPhoneNumberLabel)
        view.addSubview(nextButton)
        
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        letterImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            letterImageView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            letterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterImageView.widthAnchor.constraint(equalToConstant: 200),
            letterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            userNameTF.topAnchor.constraint(equalTo: letterImageView.bottomAnchor, constant: 30),
            userNameTF.leadingAnchor.constraint(equalTo: promptLabel.leadingAnchor),
            userNameTF.trailingAnchor.constraint(equalTo: promptLabel.trailingAnchor),
            
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

