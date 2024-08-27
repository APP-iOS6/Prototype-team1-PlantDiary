//
//  SceneDelegate.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    static let tabBarController = UITabBarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = BaseNavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let diaryViewController = BaseNavigationController(rootViewController: DiaryViewController())
        diaryViewController.tabBarItem = UITabBarItem(title: "다이어리", image: UIImage(systemName: "book.fill"), tag: 1)
        
        let plantsCareViewController = BaseNavigationController(rootViewController: PlantsCareViewController())
        plantsCareViewController.tabBarItem = UITabBarItem(title: "식물관리", image: UIImage(systemName: "leaf.fill"), tag: 2)
        
        let settingViewController = BaseNavigationController(rootViewController: SettingViewController())
        settingViewController.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape.fill"), tag: 3)
        
        SceneDelegate.tabBarController.viewControllers = [homeViewController, diaryViewController, plantsCareViewController, settingViewController]
        SceneDelegate.tabBarController.tabBar.tintColor = .baseColor
        SceneDelegate.tabBarController.tabBar.layer.borderColor = UIColor.clear.cgColor
        SceneDelegate.tabBarController.tabBar.layer.borderWidth = 0.50
        SceneDelegate.tabBarController.tabBar.clipsToBounds = true
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = AppNameViewController()
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
    }


}

