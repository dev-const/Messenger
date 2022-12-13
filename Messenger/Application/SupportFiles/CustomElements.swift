import UIKit

//MARK: Button

class CustomButton: UIButton {
    
     init(style: ButtonStyle, title: String) {
        super.init(frame: .zero)
        let height: CGFloat = 35
        layer.cornerRadius = height/2
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: CustomFont.RobotoBold.rawValue, size: 16)
        
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
    
    init(font: CustomFont.RawValue, fontSize: CGFloat, numberOfLines: Int) {
        super.init(frame: .zero)
        self.font = UIFont(name: font, size: fontSize)
        self.numberOfLines = numberOfLines
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: OneTimeTextField

class OneTimeTextField: UITextField {
    
    private var digitLabels = [UILabel]()
            
    
    private func configure() {

        let labelsStackView = createLabelsStackView()
        addSubview(labelsStackView)
        
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
    }
    
    private func createLabelsStackView(with slotCount: Int = 6) -> UIStackView {
                
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        for _ in 1...slotCount {
            let label = UILabel()
            label.layer.borderColor = UIColor(named: CustomColor.BlueLight.rawValue)?.cgColor
            label.layer.borderWidth = 1.0
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: CustomFont.RobotoRegular.rawValue, size: 16)
            label.backgroundColor = UIColor(named: CustomColor.BlueLight.rawValue)
            
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
            
        }
        return stackView
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
