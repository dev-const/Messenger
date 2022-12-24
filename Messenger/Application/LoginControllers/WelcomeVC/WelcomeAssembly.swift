import UIKit

class WelcomeAssembly: NSObject {

    override class func awakeFromNib() {
        super.awakeFromNib()
        
        let view = WelcomeViewController()
        let presenter = WelcomePresenter()
        let router = WelcomeRouter()
        
        view.output = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
    }
}
