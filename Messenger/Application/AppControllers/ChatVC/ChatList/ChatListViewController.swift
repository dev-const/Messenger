import UIKit
import MessageKit

//MARK: Protocol

protocol ChatListViewInputProtocol: AnyObject {
    var presenter: ChatListPresenter! { get }
}

//MARK: ChatListViewController

final class ChatListViewController: UIViewController {
    
    var presenter: ChatListPresenter!
    
    //MARK: Create UI objects

    //MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}


//MARK: Extension - Create constraints

extension ChatListViewController {
    
}

//MARK: Extension - VerifViewInputProtocol

extension ChatListViewController: ChatListViewInputProtocol {
    
}
