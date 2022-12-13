import UIKit

final class WelcomeViewController: UIViewController {

    //MARK: Create UI objects
    
    private let messengerLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoBold.rawValue, fontSize: 35, numberOfLines: 1)
        label.text = "Messenger"
        return label
    }()
    
    private let greetingLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 1)
        label.text = "Привет!"
        return label
    }()
    
    private let callToActionLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Приглашай собеседников и скорее начинай общение!"
        return label
    }()
    
    private let signUpButton: CustomButton = {
        let button = CustomButton(style: .blue, title: "Зарегистрироваться")
        return button
    }()
    
    private let logInButton: CustomButton = {
        let button = CustomButton(style: .white, title: "Войти")
        return button
    }()
    
    //MARK: View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()
        createConstraints()
        view.backgroundColor = .white
        
        signUpButton.addTarget(self, action: #selector(openRegVC), for: .touchUpInside)
        logInButton.addTarget(self, action: #selector(openAuthVC), for: .touchUpInside)
    }
    
    @objc private func openRegVC() {

    }
    
    @objc private func openAuthVC() {

    }
}

//MARK: Create constraints

extension WelcomeViewController {
    
    private func createConstraints() {
        
        view.addSubview(messengerLabel)
        view.addSubview(greetingLabel)
        view.addSubview(callToActionLabel)
        view.addSubview(signUpButton)
        view.addSubview(logInButton)
        
        messengerLabel.translatesAutoresizingMaskIntoConstraints = false
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        callToActionLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messengerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            messengerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            greetingLabel.topAnchor.constraint(equalTo: messengerLabel.bottomAnchor, constant: 20),
            greetingLabel.leadingAnchor.constraint(equalTo: messengerLabel.leadingAnchor),

            callToActionLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 0),
            callToActionLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            callToActionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor ),
            signUpButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: signUpButton.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: signUpButton.trailingAnchor)
        ])
    }
}
