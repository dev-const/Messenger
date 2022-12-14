import UIKit

final class VerificationViewController: UIViewController {
    
    private var isSuccess: Bool?
    
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
        let label = CustomLabel(font: CustomFont.RobotoRegular.rawValue, fontSize: 16, numberOfLines: 1)
        label.text = "КОД ВЕРИФИКАЦИИ"
        return label
    }()
    
    private let oneTimeCode: CustomOneTimeTextField = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let textField = CustomOneTimeTextField()
        return textField
    }()
    
    private let incorrectCodeLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoLight.rawValue, fontSize: 12, numberOfLines: 0)
        label.text = "Неверный код. Введите - 133337"
        label.textAlignment = .left
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    private let okButton: CustomButton = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let button = CustomButton(style: ButtonStyle.blue, title: "Готово")
        return button
    }()
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createConstraints()
        view.backgroundColor = .white
        
        oneTimeCode.configure()
        oneTimeCode.didEnterLastDigit = { [weak self] code in
            if code != "133337" {
                print("Wrong code")
                self?.incorrectCodeLabel.isHidden = false
            } else {
                self?.isSuccess = true
                self?.incorrectCodeLabel.text = "Правильный код"
                self?.incorrectCodeLabel.textColor = UIColor(named: CustomColor.Green.rawValue)
                print("Right code")
            }
        }
        okButton.addTarget(self, action: #selector(okButtonDidPress), for: .touchUpInside)
    }
    
    @objc
    private func okButtonDidPress() {
        guard let safeIsSuccess = isSuccess, safeIsSuccess else { return }
        print("User successfully logged in")
        //Go to next - ChatVC
        //UserDefaults
    }
    
    
    
}

//MARK: Create constraints

extension VerificationViewController {
    
    private func createConstraints() {
        view.addSubview(backButton)
        view.addSubview(promptLabel)
        view.addSubview(verificationCode)
        view.addSubview(oneTimeCode)
        view.addSubview(incorrectCodeLabel)
        view.addSubview(okButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        promptLabel.translatesAutoresizingMaskIntoConstraints = false
        verificationCode.translatesAutoresizingMaskIntoConstraints = false
        oneTimeCode.translatesAutoresizingMaskIntoConstraints = false
        incorrectCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            promptLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 35),
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            promptLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            verificationCode.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            verificationCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            verificationCode.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            oneTimeCode.topAnchor.constraint(equalTo: verificationCode.bottomAnchor, constant: 5),
            oneTimeCode.leadingAnchor.constraint(equalTo: verificationCode.leadingAnchor),
            oneTimeCode.trailingAnchor.constraint(equalTo: verificationCode.trailingAnchor),
            oneTimeCode.heightAnchor.constraint(equalToConstant: 40),
            
            incorrectCodeLabel.topAnchor.constraint(equalTo: oneTimeCode.bottomAnchor, constant: 2),
            incorrectCodeLabel.leadingAnchor.constraint(equalTo: oneTimeCode.leadingAnchor),
            incorrectCodeLabel.trailingAnchor.constraint(equalTo: oneTimeCode.trailingAnchor),
            
            okButton.topAnchor.constraint(equalTo: incorrectCodeLabel.bottomAnchor, constant: 35),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-30)
        ])
    }
}
