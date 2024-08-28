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
        
        label.text = "안녕하세요. \(store.loginId)님"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 20)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "DummyPlant")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.baseColor.cgColor
        
        return imageView
    }()
    
    // 회원가입으로 넘어가는 버튼
    private lazy var logOutButton: UIButton = {
        let button = UIButton()
        
        button.configuration = .plain()
        button.configuration?.image = UIImage(systemName: "xmark.circle.fill")
        button.configuration?.imagePadding = 5
        button.configuration?.imagePlacement = .leading
        button.configuration?.title = "LogOut"
        button.tintColor = .baseColor
        
        // 로그아웃 알림 창 추가
        button.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: nil, message: "로그아웃 할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel))
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self?.store.logout() // 로그아웃
                
                // SceneDelegate에서 설정한 탭바의 첫 번째 탭(HomeViewController)으로 이동
                if let tabBarController = self?.view.window?.rootViewController as? UITabBarController {
                    tabBarController.selectedIndex = 0  // 첫 번째 탭 선택
                    self?.navigationController?.popToRootViewController(animated: true)
                }
                
                let confirmationAlert = UIAlertController(title: nil, message: "로그아웃 되었습니다!", preferredStyle: .alert)
                confirmationAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    self?.dismiss(animated: true, completion: nil)
                }))
                self?.present(confirmationAlert, animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10.5
        
        return stackView
    }()
    
    private lazy var startSeparator: UIView = {
        let uIView = UIView()
        
        uIView.backgroundColor = .baseColor
        uIView.translatesAutoresizingMaskIntoConstraints = false
        
        return uIView
    }()
    
    private lazy var dataControlLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "데이터 관리"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 20)
        
        return label
    }()
    
    private lazy var dataControlSeparator: UIView = {
        let uIView = UIView()
        
        uIView.backgroundColor = .baseColor
        uIView.translatesAutoresizingMaskIntoConstraints = false
        
        return uIView
    }()
    
    private lazy var dataExportLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "내보내기"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 16)
        
        return label
    }()
    
    private lazy var alertLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "알림설정"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 20)
        
        return label
    }()
    
    private lazy var alertSeparator: UIView = {
        let uIView = UIView()
        
        uIView.backgroundColor = .baseColor
        uIView.translatesAutoresizingMaskIntoConstraints = false
        
        return uIView
    }()
    
    private lazy var pushAlertLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "푸시알림"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 16)
        
        return label
    }()
    
    private lazy var alertInventoryLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "알림목록"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 16)
        
        return label
    }()
    
    private lazy var userControlLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "나의 정보 관리"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 20)
        
        return label
    }()
    
    private lazy var userControlSeparator: UIView = {
        let uIView = UIView()
        
        uIView.backgroundColor = .baseColor
        uIView.translatesAutoresizingMaskIntoConstraints = false
        
        return uIView
    }()
    
    private lazy var userInfoEditLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "정보 수정"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 16)
        
        return label
    }()
    
    private lazy var userInfoDeleteLabel: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "정보 삭제"
        label.textColor = .baseColor
        label.textAlignment = .center
        label.font = UIFont(name: fontName, size: 16)
        
        return label
    }()
    
    private lazy var endSeparator: UIView = {
        let uIView = UIView()
        
        uIView.backgroundColor = .baseColor
        uIView.translatesAutoresizingMaskIntoConstraints = false
        
        return uIView
    }()
    
    // 회원가입으로 넘어가는 버튼
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = "안녕하세요. \(store.loginId)님"
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubviews([stackView, label, logOutButton, startSeparator, dataControlLabel, dataControlSeparator, dataExportLabel, alertLabel, alertSeparator, pushAlertLabel, alertInventoryLabel, endSeparator, userControlLabel, userControlSeparator, userInfoEditLabel, userInfoDeleteLabel])
        
        stackView.addArrangedSubviews([imageView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.heightAnchor.constraint(equalToConstant: view.bounds.width/4),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            startSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            startSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            startSeparator.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            startSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            dataControlLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            dataControlLabel.topAnchor.constraint(equalTo: startSeparator.bottomAnchor, constant: 40),
            
            dataControlSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            dataControlSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            dataControlSeparator.topAnchor.constraint(equalTo: dataControlLabel.bottomAnchor, constant: 10),
            dataControlSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            dataExportLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            dataExportLabel.topAnchor.constraint(equalTo: dataControlSeparator.bottomAnchor, constant: 10),
            
            alertLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            alertLabel.topAnchor.constraint(equalTo: dataExportLabel.bottomAnchor, constant: 40),
            
            alertSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            alertSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            alertSeparator.topAnchor.constraint(equalTo: alertLabel.bottomAnchor, constant: 10),
            alertSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            pushAlertLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            pushAlertLabel.topAnchor.constraint(equalTo: alertSeparator.bottomAnchor, constant: 10),
            
            alertInventoryLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            alertInventoryLabel.topAnchor.constraint(equalTo: pushAlertLabel.bottomAnchor, constant: 10),
            
            userControlLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userControlLabel.topAnchor.constraint(equalTo: alertInventoryLabel.bottomAnchor, constant: 40),
            
            userControlSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userControlSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            userControlSeparator.topAnchor.constraint(equalTo: userControlLabel.bottomAnchor, constant: 10),
            userControlSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            userInfoEditLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            userInfoEditLabel.topAnchor.constraint(equalTo: userControlSeparator.bottomAnchor, constant: 10),
            
            userInfoDeleteLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            userInfoDeleteLabel.topAnchor.constraint(equalTo: userInfoEditLabel.bottomAnchor, constant: 10),
            
            endSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            endSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            endSeparator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            endSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            logOutButton.topAnchor.constraint(equalTo: endSeparator.bottomAnchor, constant: 25),
            logOutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}

#Preview {
    SettingViewController()
}
