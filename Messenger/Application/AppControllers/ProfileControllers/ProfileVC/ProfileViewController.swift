import UIKit

//MARK: Protocol

protocol ProfileViewInputProtocol: AnyObject {
    
    var presenter: ProfileViewOutputProtocol! { get }
}

//MARK: ViewController

final class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewOutputProtocol!
    
    //MARK: Create UI objects
    
    private lazy var topView: UIView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 130))
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(named: CustomColor.BlueLight.rawValue)
        return  view
    }()
    
    private lazy var userNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoBold.rawValue, fontSize: 20, numberOfLines: 2)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Имя пользователя"
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 120, height: 120))
        let imageView = UIImageView(frame: frame)
        imageView.layer.cornerRadius = imageView.bounds.height/2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor(named: CustomColor.BlueLight.rawValue)
        imageView.image = UIImage(systemName: "person.badge.plus")
        return imageView
    }()
    
    private lazy var editButton: CustomButton = {
        let button = CustomButton(style: ButtonStyle.white, title: "Редактировать")
        return button
    }()
    
    private lazy var nickNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoRegular.rawValue, fontSize: 16, numberOfLines: 1)
        label.textColor = .lightGray
        label.text = "Никнейм"
        return label
    }()
    
    private lazy var phoneNumberLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoBold.rawValue, fontSize: 18, numberOfLines: 1)
        label.textColor = .black
        label.text = "Номер телефона"
        return label
    }()
    
    private lazy var mapPinImageView: UIImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 20))
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var cityNameLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoRegular.rawValue, fontSize: 16, numberOfLines: 1)
        label.textColor = .lightGray
        label.text = "Город"
        return label
    }()
    
    private lazy var calendarImageView: UIImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 20))
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var dateOfBirthLabel: CustomLabel = {
        let label = CustomLabel(font: CustomFont.RobotoRegular.rawValue, fontSize: 16, numberOfLines: 1)
        label.textColor = .lightGray
        label.text = "Дата рождения"
        return label
    }()
    
    private lazy var zodiacImageView: UIImageView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 20, height: 20))
        let imageView = UIImageView(frame: frame)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Близнецы")
        imageView.tintColor = .lightGray
        return imageView
    }()
    
    private lazy var bioTextView: UITextView = {
        let frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 200))
        let textView = UITextView(frame: frame)
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.contentMode = .left
        textView.showsVerticalScrollIndicator = false
        textView.font = UIFont(name: CustomFont.RobotoLight.rawValue, size: 16)
        textView.text = "О себе Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.О себе Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.О себе Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        return textView
    }()
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func editButtonPressed() {
        print("Edit button did pressed")
    }
}

//MARK: Extension - ProfileViewInputProtocol
extension ProfileViewController: ProfileViewInputProtocol {
    
}

//MARK: Extension - Create constraints

extension ProfileViewController {
    
    private func setConstraints() {
        
        view.addSubview(topView)
        view.addSubview(userNameLabel)
        view.addSubview(avatarImageView)
        view.addSubview(editButton)
        view.addSubview(nickNameLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(mapPinImageView)
        view.addSubview(cityNameLabel)
        view.addSubview(calendarImageView)
        view.addSubview(dateOfBirthLabel)
        view.addSubview(zodiacImageView)
        view.addSubview(bioTextView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        nickNameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        mapPinImageView.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        zodiacImageView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.widthAnchor.constraint(equalTo: view.widthAnchor),
            topView.heightAnchor.constraint(equalToConstant: 130),
            
            userNameLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: avatarImageView.bounds.height/2),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ConstantsForConstraints.LeftIntoView.rawValue),
            
            editButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            editButton.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            nickNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 24),
            nickNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            
            phoneNumberLabel.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 24),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: nickNameLabel.leadingAnchor),
            
            mapPinImageView.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 24),
            mapPinImageView.leadingAnchor.constraint(equalTo: phoneNumberLabel.leadingAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: mapPinImageView.topAnchor),
            cityNameLabel.leadingAnchor.constraint(equalTo: mapPinImageView.trailingAnchor, constant: 8),
            
            calendarImageView.topAnchor.constraint(equalTo: mapPinImageView.bottomAnchor, constant: 24),
            calendarImageView.leadingAnchor.constraint(equalTo: mapPinImageView.leadingAnchor),
            
            dateOfBirthLabel.topAnchor.constraint(equalTo: calendarImageView.topAnchor),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 8),
            
            zodiacImageView.topAnchor.constraint(equalTo: dateOfBirthLabel.topAnchor),
            zodiacImageView.leadingAnchor.constraint(equalTo: dateOfBirthLabel.trailingAnchor, constant: 8),
            zodiacImageView.widthAnchor.constraint(equalToConstant: 20),
            zodiacImageView.heightAnchor.constraint(equalToConstant: 20),
            
            bioTextView.topAnchor.constraint(equalTo: calendarImageView.bottomAnchor, constant: 16),
            bioTextView.leadingAnchor.constraint(equalTo: calendarImageView.leadingAnchor),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: ConstantsForConstraints.RightIntoView.rawValue),
            bioTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
