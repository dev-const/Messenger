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
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Custom OneTimeTextField for verification viewController

class CustomOneTimeTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
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
            label.layer.borderWidth = 1.0
            label.font = .systemFont(ofSize: 30)
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