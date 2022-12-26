import UIKit

//MARK: Button

class CustomButton: UIButton {
    
    init(style: ButtonStyle, title: String) {
        super.init(frame: .zero)
        let height: CGFloat = 35
        layer.cornerRadius = height/2
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: CustomFont.RobotoBold.rawValue,
                                  size: 16)
        alpha = 0
        
        switch style {
        case .white:
            setTitleColor(UIColor(named: CustomColor.Blue.rawValue), for: .normal)
            backgroundColor = .white
            layer.borderColor = UIColor(named: CustomColor.Blue.rawValue)?.cgColor
            layer.borderWidth = 1.0
            
        case .blue:
            setTitleColor(UIColor.white, for: .normal)
            backgroundColor = UIColor(named: CustomColor.Blue.rawValue)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Label

class CustomLabel: UILabel {
    
    init(font: CustomFont.RawValue,
         fontSize: CGFloat,
         numberOfLines: Int) {
        super.init(frame: .zero)
        self.font = UIFont(name: font, size: fontSize)
        self.numberOfLines = numberOfLines
        alpha = 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: ImageView

class CustomImageView: UIImageView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentMode = .scaleAspectFit
        alpha = 0
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 8, height: 12)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Custom OneTimeTextField for verification viewController

class CustomOneTimeTextField: UITextField {
    
    init() { super.init(frame: .zero)
    }
    
    var didEnterLastDigit: ((String) -> Void)?
    
    private var digitLabels = [UILabel]()
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with slotCount: Int = 6) {
        
        configureTextField()
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: topAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        alpha = 0
        
        addTarget(self, action: #selector(textDidChange),
                  for: .editingChanged)
        delegate = self
    }
    
    private func createLabelsStackView(with slotCount: Int) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1...slotCount {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.backgroundColor = .white
            label.layer.borderColor = UIColor(named: CustomColor.BlueLight.rawValue)?.cgColor
            label.layer.borderWidth = 4.0
            label.layer.cornerRadius = 16
            label.font = UIFont(name: CustomFont.RobotoBold.rawValue, size: 28)
            label.isUserInteractionEnabled = true
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
        }
        return stackView
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0..<digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            } else {
                currentLabel.text?.removeAll()
            }
        }
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomOneTimeTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
}


// MARK: Custom animation for the TextField on invalid code

extension CustomOneTimeTextField {
    
    func shake() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 3, y: center.y))
        shakeAnimation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 3, y: center.y))
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 5
        shakeAnimation.autoreverses = true
        
        layer.add(shakeAnimation, forKey: "position")
    }
}
