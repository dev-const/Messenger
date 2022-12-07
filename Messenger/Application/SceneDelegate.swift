import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var userDefaults = UserDefaults.standard

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        var isLogin = userDefaults.object(forKey: "isLogin") as? Bool ?? false
        
        if isLogin {
            startApp()
        } else {
            startLogin()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    //MARK: Func for check user authorization
    
   private func startApp() {
        let bundle = Bundle(path: "Messanger.app/Messanger/Application/AppControllers/Chat/ChatList/")
        let startVC = UIStoryboard(name: "ChatList", bundle: bundle).instantiateViewController(withIdentifier: "ChatTabBarVC")
        self.window?.rootViewController = startVC
        self.window?.makeKeyAndVisible()
    }
    
   private func startLogin() {
        let bundle = Bundle(path: "Messanger.app/Messanger/Application/LoginControllers/MainController/")
        let mainVC = UIStoryboard(name: "Main", bundle: bundle).instantiateViewController(withIdentifier: "MainVC")
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
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

