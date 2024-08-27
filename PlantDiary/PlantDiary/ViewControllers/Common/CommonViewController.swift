//
//  CommonViewController.swift
//  PlantDiary
//
//  Created by 김종혁 on 8/27/24.
//

import UIKit

class CommonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupSubviews()
        setupLayout()
    }
    
    func setupSubviews() {
        
    }
    
    func setupLayout() {
        for subview in view.subviews {
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
