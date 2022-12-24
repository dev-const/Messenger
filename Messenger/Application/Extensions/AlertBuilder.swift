import UIKit

protocol AlertBuilder: AnyObject {
    
    func createAlert(title: AlertMessages.RawValue,
                     message: AlertMessages.RawValue,
                     actionTitle: AlertMessages.RawValue) -> UIAlertController
}

final class CustomAlert: AlertBuilder {
    
    func createAlert(title: AlertMessages.RawValue,
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
    case checkYourInternetConnection = "Check your internet connection"
    case ok = "OK"
}
