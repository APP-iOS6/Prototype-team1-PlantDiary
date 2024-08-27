//
//  AppNameViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class AppNameViewController: BaseViewController {
    private lazy var appNameImageView: UIImageView = {
        let imageView = UIImageView()
        
        let image = UIImage(named: "앱이름")
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubview(appNameImageView)
        
        showAppNameLabel()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            appNameImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            appNameImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            appNameImageView.widthAnchor.constraint(equalToConstant: 200),
            appNameImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func showAppNameLabel() {
        appNameImageView.alpha = 0
        
        UIView.animate(withDuration: 1.0, animations: {
            self.appNameImageView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 1.0, delay: 1.0, options: [], animations: {
                self.appNameImageView.alpha = 0
            }, completion: { _ in
                self.showMainViewController()
            })
        }
    }
    
    private func showMainViewController() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = SceneDelegate.tabBarController
            window.makeKeyAndVisible()
        }
    }
}

#Preview {
    AppNameViewController()
}
