import UIKit

//MARK: Protocol

protocol AuthViewInputProtocol: AnyObject {
    var output: AuthViewOutputProtocol! { get }
    
    func closeSelfVC()
    func openNextVC()
}

//MARK: ViewController

final class AuthorizationViewController: UIViewController, AuthViewInputProtocol {
    
    var output: AuthViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var closeButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        let button = UIButton(frame: frame)
        let image = UIImage(systemName: "xmark")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: CustomColor.Blue.rawValue)
        button.contentMode = .scaleAspectFill
        button.alpha = 0
        return button
    }()
    
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
        view.backgroundColor = .white
        setConstraints()
        phoneNumberTF.delegate = self
        userNameTF.delegate = self
        
        closeButton.addTarget(self, action: #selector(closeSelfVC), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(openNextVC), for: .touchUpInside)
    }
    
    @objc
    func closeSelfVC() {
        animateForViewWillDisappear()
//        output.
    }
    
    @objc
    func openNextVC() {
        animateForViewWillDisappear()
//        output.
    }
    
    //MARK: ViewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      animateForViewDidAppear()
    }
    
    
    //MARK: Animate functions
    
    private func animateForViewDidAppear() {
        
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 1.0
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
            self.closeButton.alpha = 0
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

//MARK: UITextFieldDelegate

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

//MARK: Create constraints

extension AuthorizationViewController {
    
    private func setConstraints() {
        
        view.addSubview(closeButton)
        view.addSubview(promptLabel)
        view.addSubview(letterImageView)
        view.addSubview(userNameTF)
        view.addSubview(incorrectUserNameLabel)
        view.addSubview(phoneNumberTF)
        view.addSubview(incorrectPhoneNumberLabel)
        view.addSubview(nextButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        letterImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectUserNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTF.translatesAutoresizingMaskIntoConstraints = false
        incorrectPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            promptLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -30),
            
            letterImageView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            letterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterImageView.widthAnchor.constraint(equalToConstant: 200),
            letterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            userNameTF.topAnchor.constraint(equalTo: letterImageView.bottomAnchor, constant: 30),
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

