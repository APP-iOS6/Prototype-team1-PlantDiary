//
//  SettingViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class SettingViewController: BaseViewController {
    private let store: Store = Store.shared
    
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "\(store.loginId)님"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "식물이")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1.5
        
        return imageView
    }()
    
    // 회원가입으로 넘어가는 버튼
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그아웃", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 100)
        button.backgroundColor = .darkGray
        button.addAction(UIAction { [] _ in
            self.store.logout() // 로그아웃
            
            // SceneDelegate에서 설정한 탭바의 첫 번째 탭(HomeViewController)으로 이동
            if let tabBarController = self.view.window?.rootViewController as? UITabBarController {
                tabBarController.selectedIndex = 0  // 첫 번째 탭 선택
                self.navigationController?.popToRootViewController(animated: true)
            }
            
            print("로그아웃 성공")
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 10.5
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = "\(store.loginId)님"
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubview(stackView)
        view.addSubview(logOutButton)
        
        stackView.addArrangedSubviews([label, imageView])
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.heightAnchor.constraint(equalToConstant: view.bounds.width/4),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            logOutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logOutButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
        ])
    }
}

#Preview {
    SettingViewController()
}
