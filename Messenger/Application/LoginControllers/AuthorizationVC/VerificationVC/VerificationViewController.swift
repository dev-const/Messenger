import UIKit

//MARK: Protocol

protocol VerifViewInputProtocol: AnyObject {
    
    var presenter: VerifViewOutputProtocol! { get }
    func changeStatustCode(_ answer: ResponseMessages.RawValue)
}

//MARK: ViewController

final class VerificationViewController: UIViewController {
    
    var presenter: VerifViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var promptLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Последний шаг. Введите полученный код для верификации номера"
        return label
    }()
    
    private lazy var letterImageView: CustomImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 100))
        let imageView = CustomImageView(frame: frame)
        imageView.image = UIImage(named: "4-opened-envelope")
        return imageView
    }()
    
    private lazy var verificationCode: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoMedium.rawValue, fontSize: 16, numberOfLines: 1)
        label.text = "КОД ВЕРИФИКАЦИИ"
        return label
    }()
    
    private lazy var oneTimeCode: CustomOneTimeTextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let textField = CustomOneTimeTextField()
        return textField
    }()
    
    private lazy var statusCodeLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 14, numberOfLines: 1)
        label.text = "Неверный код. Для теста введите - 133337"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private lazy var okButton: CustomButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let button = CustomButton(style: ButtonStyle.white, title: "Отправить заново")
        return button
    }()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //FIXME: Пока не придумал как это лучше сделать
        let router = VerifRouter()
        let presenter = VerifPresenter()
        let interactor = VerifInteractor()
        
        self.presenter = presenter
        presenter.view = self
        presenter.router = router
        router.viewController = self
        interactor.presenter = presenter
        presenter.interactor = interactor
        
        setConstraints()
        oneTimeCode.delegate = self
        oneTimeCode.layer.cornerRadius = oneTimeCode.frame.height/2
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        okButton.addTarget(self, action: #selector(okButtonDidPress), for: .touchUpInside)
        
        oneTimeCode.configure()
        oneTimeCode.didEnterLastDigit = { [weak self] code in
            self?.presenter.sendToCheckCode(self?.oneTimeCode.text ?? "")
        }
    }
    
    //MARK: Settings keyboard
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    func okButtonDidPress() {
        guard let text = oneTimeCode.text, text.count == 6 else { oneTimeCode.shake()
            return }
        presenter.sendToCheckCode(text)
    }
    
    //MARK: ViewDidAppear
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateForViewDidAppear()
        view.backgroundColor = .white
    }
    
    //MARK: ViewWillDisappear
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        animateForViewWillDisappear()
    }
}
//MARK: Extension - VerifViewInputProtocol

extension VerificationViewController: VerifViewInputProtocol {
    
    func changeStatustCode(_ answer: ResponseMessages.RawValue) {

            switch answer {
            case ResponseMessages.rightCode.rawValue:
                DispatchQueue.main.async {
                    self.statusCodeLabel.isHidden = false
                    self.statusCodeLabel.text = answer
                    self.statusCodeLabel.textColor = UIColor(named: CustomColor.Green.rawValue)
                }
                presenter.presentChatListVC()
            case ResponseMessages.wrongCode.rawValue:
                DispatchQueue.main.async {
                    self.oneTimeCode.shake()
                    self.statusCodeLabel.isHidden = false
                }
            default:
                break
        }
    }
}

//MARK: Extension - Animate functions

extension VerificationViewController {
    
    private func animateForViewDidAppear() {
        
        UIView.animate(withDuration: 0.3) {
            self.promptLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 0.5) {
            self.verificationCode.alpha = 1.0
            self.oneTimeCode.alpha = 1.0
            self.statusCodeLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 0.7) {
            self.okButton.alpha = 1.0
            self.letterImageView.alpha = 1.0
        }
    }
    
    private func animateForViewWillDisappear() {
        
        UIView.animate(withDuration: 0.7) {
            self.promptLabel.alpha = 0
            self.letterImageView.alpha = 0
        }
        UIView.animate(withDuration: 0.5) {
            self.verificationCode.alpha = 0
            self.oneTimeCode.alpha = 0
            self.statusCodeLabel.alpha = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.okButton.alpha = 0
        }
    }
}

//MARK: Extension - UITextFieldDelegate

extension VerificationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: Extension - Create constraints

extension VerificationViewController {
    
    private func setConstraints() {
        view.addSubview(promptLabel)
        view.addSubview(letterImageView)
        view.addSubview(verificationCode)
        view.addSubview(oneTimeCode)
        view.addSubview(statusCodeLabel)
        view.addSubview(okButton)
        
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        letterImageView.translatesAutoresizingMaskIntoConstraints = false
        verificationCode.translatesAutoresizingMaskIntoConstraints = false
        oneTimeCode.translatesAutoresizingMaskIntoConstraints = false
        statusCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            promptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            letterImageView.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 20),
            letterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterImageView.widthAnchor.constraint(equalToConstant: 200),
            letterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            verificationCode.topAnchor.constraint(equalTo: letterImageView.bottomAnchor, constant: 30),
            verificationCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            verificationCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            oneTimeCode.topAnchor.constraint(equalTo: verificationCode.bottomAnchor, constant: 5),
            oneTimeCode.leadingAnchor.constraint(equalTo: verificationCode.leadingAnchor),
            oneTimeCode.trailingAnchor.constraint(equalTo: verificationCode.trailingAnchor),
            oneTimeCode.heightAnchor.constraint(equalToConstant: 60),
            
            statusCodeLabel.topAnchor.constraint(equalTo: oneTimeCode.bottomAnchor, constant: 2),
            statusCodeLabel.leadingAnchor.constraint(equalTo: oneTimeCode.leadingAnchor),
            statusCodeLabel.trailingAnchor.constraint(equalTo: oneTimeCode.trailingAnchor),
            
            okButton.topAnchor.constraint(equalTo: statusCodeLabel.bottomAnchor, constant: 10),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue)
        ])
    }
}
