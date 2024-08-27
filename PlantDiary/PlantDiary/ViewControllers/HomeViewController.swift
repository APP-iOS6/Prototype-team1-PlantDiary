//
//  HomeViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class HomeViewController: CommonViewController {
    
    var isLoggedIn: Bool = false
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "오늘의 감정상태"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image: UIImage = UIImage(imageLiteralResourceName: "식물이")
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10.5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭 제스처 추가
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        // 탭바 제스처 추가
        if let tabBar = self.tabBarController?.tabBar {
            let tabBarTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTabBarTap))
            tabBar.addGestureRecognizer(tabBarTapGesture)
        }
    }
    
    
    override func setupSubviews() {
        view.addSubview(stackView)
        view.addSubview(label)
        view.addSubview(imageView)
        
        stackView.addArrangedSubview(label)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            // 라벨은 상단
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            // 이미지는 화면 중앙에 배치
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    // 탭 이벤트
    @objc private func handleTap() {
        if isLoggedIn {
            // 로그인 된 상태에서는 동작X
            return
        } else {
            // 로그인이 안된 상태
            let nextViewController = LoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @objc private func handleTabBarTap() {
        if isLoggedIn {
            // 로그인 된 상태에서는 동작 X
            return
        } else {
            // 로그인이 안 된 상태 -> 로그인 화면으로 이동
            let nextViewController = LoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
}

#Preview {
    HomeViewController()
}
