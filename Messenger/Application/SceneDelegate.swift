import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var userDefaults = UserDefaults.standard
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let isSignIn = userDefaults.object(forKey: "isSignIn") as? Bool ?? false
        
        if isSignIn {
            self.window?.rootViewController = ChatListViewController()
        } else {
            let navigationController = UINavigationController(rootViewController: WelcomeAssembly.build())
            navigationController.navigationBar.isTranslucent = true
            self.window?.rootViewController = navigationController
            
//            RegAssembly.build()
//            AuthAssembly.build()
//            VerificationAssembly.build()
        }
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .white
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

