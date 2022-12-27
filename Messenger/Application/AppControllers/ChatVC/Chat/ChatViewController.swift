import UIKit
import MessageKit

//FIXME: Test
let sender1 = Sender(senderId: "1", displayName: "Вы")
let sender2 = Sender(senderId: "2", displayName: "ij")

let messages: [MessageType] = []

//MARK: Protocol

protocol ChatViewInputProtocol: AnyObject {
    var presenter: ChatViewOutputProtocol! { get }
}

//MARK: MessagesViewController

final class ChatViewController: MessagesViewController {
    
    var presenter: ChatViewOutputProtocol!
    
    //MARK: Create UI objects
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource      = self
        messagesCollectionView.messagesLayoutDelegate  = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}


//MARK: Extension - ChatViewInputProtocol

extension ChatViewController: ChatViewInputProtocol {
    
}

//MARK: Extension - messagesDataSource

extension ChatViewController: MessagesDataSource {
    
    var currentSender: MessageKit.SenderType {
        return Sender(senderId: "any_unique_id", displayName: "Steven")
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}

//MARK: Extension - messagesDisplayDelegate, messagesLayoutDelegate

extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
    
}
