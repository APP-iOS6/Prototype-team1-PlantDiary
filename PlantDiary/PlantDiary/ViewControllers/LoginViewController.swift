//
//  LoginViewController.swift
//  PlantDiary
//
//  Created by 김종혁 on 8/27/24.
//

import UIKit

class LoginViewController: CommonViewController {
    
    private lazy var imageView: UIImageView = {
        let image: UIImage = UIImage(imageLiteralResourceName: "식물이")
        
        let imageView: UIImageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 아이디
    private lazy var idTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "아이디"
        textField.borderStyle = .roundedRect // 모서리 라운딩
        return textField
    }()
    
    // 비밀번호
    private lazy var passwordTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true // 비밀번호 가리기
        return textField
    }()
    
    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .darkGray
        
        button.addAction(UIAction { _ in
            // 버튼 클릭 시 액션
        }, for: .touchUpInside)
        
        return button
    }()
    
    // 회원가입으로 넘어가는 버튼
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("SignUp", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 뒤로갈 때 다시 탭바 보이게
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func setupSubviews() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(idTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signUpButton)
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
