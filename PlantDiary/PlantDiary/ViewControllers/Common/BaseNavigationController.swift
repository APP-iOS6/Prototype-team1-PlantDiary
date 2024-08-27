//
//  BaseNavigationController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.baseColor
        ]
        
        let barButtonItemAppearance = UIBarButtonItemAppearance()
        barButtonItemAppearance.normal.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 25),
            .foregroundColor: UIColor.baseColor
        ]
        
        appearance.buttonAppearance = barButtonItemAppearance
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        appearance.backgroundColor = .baseColor2
        
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.standardAppearance = appearance
        
        navigationBar.layer.borderColor = UIColor.clear.cgColor
        navigationBar.layer.borderWidth = 0.50
        navigationBar.clipsToBounds = true
    }
}
