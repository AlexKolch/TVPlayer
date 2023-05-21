//
//  SceneDelegate.swift
//  TVPlayer
//
//  Created by Алексей Колыченков on 18.05.2023.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
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

@available(iOS 13.0, *)
extension SceneDelegate {
    private func makeRootViewController() -> UIViewController {
        let mainVC = MainViewController()
        let navBarVC = UINavigationController(rootViewController: mainVC)
        return navBarVC
    }
}

