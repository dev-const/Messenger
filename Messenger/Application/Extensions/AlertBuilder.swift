import UIKit

protocol AlertBuilder: AnyObject {
    
    static func createAlert(title: AlertMessages.RawValue,
                     message: AlertMessages.RawValue,
                     actionTitle: AlertMessages.RawValue) -> UIAlertController
}

class CustomAlert: AlertBuilder {
    
    static func createAlert(title: AlertMessages.RawValue,
                     message: AlertMessages.RawValue,
                     actionTitle: AlertMessages.RawValue) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle,
                                   style: .default)
        alertController.addAction(action)
        
        return alertController
    }
}

enum AlertMessages: String {
    case failedToGetData = "Failed to get data"
    case failedToSendData = "Failed to send data"
    case failedToCheckData = "Failed to check data"
    case checkYourInternetConnection = "Check your internet connection"
    case ok = "OK"
}
