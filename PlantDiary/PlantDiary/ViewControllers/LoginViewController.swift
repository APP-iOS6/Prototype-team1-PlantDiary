//
//  LoginViewController.swift
//  PlantDiary
//
//  Created by 김종혁 on 8/27/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "DummyPlant")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // 아이디
    private lazy var idTextField: UITextField = {
        let textField: UITextField = UITextField()
        
        textField.placeholder = "아이디"
        textField.font = UIFont(name: fontName, size: 18)
        textField.borderStyle = .roundedRect // 모서리 라운딩
        
        return textField
    }()
    
    // 비밀번호
    private lazy var passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: fontName, size: 18)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true // 비밀번호 가리기
        
        return textField
    }()
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: fontName, size: 15)
        button.backgroundColor = .darkGray
        
        button.addAction(UIAction { [weak self] _ in
            guard let self = self,
                  let userId = self.idTextField.text, !userId.isEmpty,
                  let passwordText = self.passwordTextField.text, !passwordText.isEmpty,
                  let password = Int(passwordText) else {
                return
            }
            
            if Store.shared.login(userId: userId, password: password) {
                let successAlert = UIAlertController(title: "성공", message: "로그인 성공", preferredStyle: .alert)
                successAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    self.navigationController?.popViewController(animated: true) // 화면 뒤로가기
                }))
                self.present(successAlert, animated: true, completion: nil)
            } else {
                let failureAlert = UIAlertController(title: "실패", message: "로그인 실패. 사용자 ID 또는 비밀번호를 확인하세요.", preferredStyle: .alert)
                failureAlert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(failureAlert, animated: true, completion: nil)
            }
        }, for: .touchUpInside)
        
        return button
    }()
    
    
    // 회원가입으로 넘어가는 버튼
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("SignUp", for: .normal)
        button.titleLabel?.font = UIFont(name: fontName, size: 15) 
        button.backgroundColor = .darkGray
        button.addAction(UIAction { _ in
            let viewController = SignUpViewController()
            viewController.modalPresentationStyle = .pageSheet
            
            self.present(viewController, animated: true)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 12
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 탭바 안보이게
        self.tabBarController?.tabBar.isHidden = true
        
        let leftButton = UIBarButtonItem(title: "←", primaryAction: UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        } )
        
        navigationItem.leftBarButtonItem = leftButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 뒤로갈 때 다시 탭바 보이게
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func setupSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubviews([imageView, idTextField, passwordTextField, loginButton, signUpButton])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            idTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -60),
        ])
    }
}

#Preview {
    LoginViewController()
}
