import UIKit

final class VerificationViewController: UIViewController {
    
    //    private let codeTF: UITextField = {
    //        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 34))
    //        let textField = UITextField(frame: frame)
    //        textField.borderStyle = .roundedRect
    //        textField.placeholder = "Код подтверждения"
    //        textField.textAlignment = .center
    //        textField.font = UIFont(name: CustomFont.RobotoBold.rawValue, size: 24)
    //        textField.returnKeyType = .done
    //        textField.textContentType = .telephoneNumber
    //        textField.keyboardType = .numberPad
    //        return textField
    //    }()
    
    //MARK: Create UI objects
    
    private let backButton: UIButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        let button = UIButton(frame: frame)
        let image = UIImage(systemName: "arrowshape.backward")
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: CustomColor.Blue.rawValue)
        button.contentMode = .scaleAspectFill
        return button
    }()
    
    private let promptLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 26, numberOfLines: 0)
        label.text = "Введите полученный код для верификации номера"
        return label
    }()
    
    private let verificationCode: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoBold.rawValue, fontSize: 16, numberOfLines: 1)
        label.text = "КОД ВЕРИФИКАЦИИ"
        return label
    }()
    
    private let oneTimeCode: OneTimeTextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let textField = OneTimeTextField(coder: .init())
        textField.text = "133337"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createConstraints()
        view.backgroundColor = .white
        //        codeTF.delegate = self
        
    }
    
    
    
    
}

extension VerificationViewController: UITextFieldDelegate {
    
}

//MARK: Create constraints

extension VerificationViewController {
    
    private func createConstraints() {
        view.addSubview(backButton)
        view.addSubview(promptLabel)
        view.addSubview(verificationCode)
        view.addSubview(oneTimeCode)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        verificationCode.translatesAutoresizingMaskIntoConstraints = false
        oneTimeCode.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            promptLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 35),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            verificationCode.topAnchor.constraint(equalTo: promptLabel.bottomAnchor, constant: 35),
            verificationCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verificationCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            oneTimeCode.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            oneTimeCode.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oneTimeCode.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
