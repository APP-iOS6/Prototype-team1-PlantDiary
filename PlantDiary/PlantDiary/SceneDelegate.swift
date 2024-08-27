//
//  SceneDelegate.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let diaryViewController = UINavigationController(rootViewController: DiaryViewController())
        diaryViewController.tabBarItem = UITabBarItem(title: "다이어리", image: UIImage(systemName: "book.fill"), tag: 1)
        
        let plantsCareViewController = UINavigationController(rootViewController: PlantsCareViewController())
        plantsCareViewController.tabBarItem = UITabBarItem(title: "식물관리", image: UIImage(systemName: "leaf.fill"), tag: 2)
        
        let settingViewController = UINavigationController(rootViewController: SettingViewController())
        settingViewController.tabBarItem = UITabBarItem(title: "설정", image: UIImage(systemName: "gearshape.fill"), tag: 3)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeViewController, diaryViewController, plantsCareViewController, settingViewController]
        
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
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

