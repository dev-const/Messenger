import UIKit

final class WelcomeViewController: UIViewController, WelcomeViewInputProtocol {
    
    var output: WelcomeViewOutputProtocol!
    var versionApp = "1.0.0"
    
    //MARK: Create UI objects
    
    private lazy var messengerLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoBold.rawValue, fontSize: 35, numberOfLines: 1)
        label.text = "Messenger"
        return label
    }()
    
    private lazy var greetingLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 1)
        label.text = "Привет!"
        return label
    }()
    
    private lazy var callToActionLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Приглашай собеседников и скорее начинай общение!"
        return label
    }()
    
    private lazy var letterImageView: CustomImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 100))
        let imageView = CustomImageView(frame: frame)
        imageView.image = UIImage(named: "1-white-envelope")
        return imageView
    }()
    
    private lazy var signUpButton: CustomButton = {
        let button = CustomButton(style: .blue, title: "Зарегистрироваться")
        return button
    }()
    
    private lazy var logInButton: CustomButton = {
        let button = CustomButton(style: .white, title: "Войти")
        return button
    }()
    
    private lazy var infoAppVersion: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Messenger. \(Calendar.current.component(.year, from: Date())). Version \(versionApp)"
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        signUpButton.addTarget(self, action: #selector(openRegVC), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(openAuthVC), for: .touchUpInside)
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateForViewDidAppear()
    }
    
    @objc func openRegVC() {
        animateForViewWillDisappear()
//        output.openRegVC()
    }
    
    @objc func openAuthVC() {
        animateForViewWillDisappear()
//        output.openAuthVC()
    }
    
    //MARK: Animate functions
    
    private func animateForViewDidAppear() {
        
        UIView.animate(withDuration: 0.3) {
            self.messengerLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 0.5) {
            self.greetingLabel.alpha = 1.0
        }
        UIView.animate(withDuration: 0.7) {
            self.callToActionLabel.alpha = 1.0
            self.letterImageView.alpha = 1.0
            self.signUpButton.alpha = 1.0
            self.logInButton.alpha = 1.0
            self.infoAppVersion.alpha = 1.0
        }
    }
    
    private func animateForViewWillDisappear() {
        
        UIView.animate(withDuration: 0.7) {
            self.messengerLabel.alpha = 0
            self.letterImageView.alpha = 1.0
        }
        
        UIView.animate(withDuration: 0.5) {
            self.greetingLabel.alpha = 0
        }
        
        UIView.animate(withDuration: 0.3) {
            self.callToActionLabel.alpha = 0
            self.signUpButton.alpha = 0
            self.logInButton.alpha = 0
            self.infoAppVersion.alpha = 0
        }
    }
}

//MARK: Create constraints

extension WelcomeViewController {
    
    private func setConstraints() {
        
        view.addSubview(messengerLabel)
        view.addSubview(greetingLabel)
        view.addSubview(callToActionLabel)
        view.addSubview(letterImageView)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        view.addSubview(infoAppVersion)
        
        messengerLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        callToActionLabel.translatesAutoresizingMaskIntoConstraints = false
        letterImageView.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        infoAppVersion.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messengerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            messengerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            
            greetingLabel.topAnchor.constraint(equalTo: messengerLabel.bottomAnchor, constant: 20),
            greetingLabel.leadingAnchor.constraint(equalTo: messengerLabel.leadingAnchor),

            callToActionLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 0),
            callToActionLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            callToActionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            letterImageView.topAnchor.constraint(equalTo: callToActionLabel.bottomAnchor, constant: 20),
            letterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterImageView.heightAnchor.constraint(equalToConstant: 200),
            letterImageView.widthAnchor.constraint(equalToConstant: 200),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: letterImageView.bottomAnchor, constant: 20),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor),
            
            infoAppVersion.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            infoAppVersion.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            infoAppVersion.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue)
        ])
    }
}
