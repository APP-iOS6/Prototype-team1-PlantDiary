//
//  CommonViewController.swift
//  PlantDiary
//
//  Created by 김종혁 on 8/27/24.
//

import UIKit

class BaseViewController: UIViewController {
    let fontName = "RIDIBatang"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .baseColor2
        
        setupSubviews()
        setupLayout()
        
        setTitle(andImage: UIImage(named: "AppName")!)
        
        let tabBarAppearance = UITabBarAppearance()
        
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .font: UIFont(name: "RIDIBatang", size: 16)!,
            .foregroundColor: UIColor.baseColor
        ]
        
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .font: UIFont(name: "RIDIBatang", size: 16)!,
            .foregroundColor: UIColor.baseColor
        ]
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        tabBarAppearance.backgroundColor = .baseColor2
    }
    
    func setupSubviews() {
        
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension BaseViewController {
    func setTitle(andImage image: UIImage) {
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let titleView = imageView
        
        navigationItem.titleView = titleView
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
