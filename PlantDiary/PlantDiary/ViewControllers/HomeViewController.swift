//
//  HomeViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

struct User {
    var userId: String
    var userPassword: Int
}

final class Store {
    public static let shared = Store()
    private(set) var isLogin: Bool = false
    private var userList: [User] = []
    public var loginId: String = ""
    
    init() {
        userList = [
            User(userId: "1234", userPassword: 1234)
        ]
    }
    
    // 로그인 목록 찾기
    func searchUser(userId: String, password: Int) -> Bool {
        // 사용자 목록에서 id와 비밀번호를 확인
        return userList.contains { $0.userId == userId && $0.userPassword == password }
        // 있다면 true 반환
    }
    
    // 로그인 꾸욱
    func login(userId: String, password: Int) -> Bool {
        if searchUser(userId: userId, password: password) {
            isLogin = true
            loginId = userId
            return true
        }
        return false
    }
    
    func logout() {
        isLogin = false
    }
    
    public func addUser(userId: String, password: Int)  {
        let user = User(userId: userId, userPassword: password)
        userList.append(user)
    }
}

// MARK: HomeViewController
class HomeViewController: BaseViewController {
    private let store: Store = Store.shared
    
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = "오늘의 감정상태"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "식물이")
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 10.5
        
        return stackView
    }()
    
    // 처음 뷰가 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        // 탭 제스처
        if store.isLogin {
            // 로그인 된 상태에서는 기본 탭바 동작을 사용
            removeTabBarGesture()
        } else {
            // 로그인 안 된 상태에서는 탭바 제스처 추가
            addTabBarGesture()
        }
    }
    // 뷰가 화면에 나타날 때마다
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 로그인 상태가 변경될 수 있으니 탭바 제스처를 업데이트
        if store.isLogin {
            removeTabBarGesture()
        } else {
            addTabBarGesture()
        }
    }
    // 뷰가 화면에 사라지기 직전
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeTabBarGesture()
    }
    
    override func setupSubviews() {
        view.addSubviews([stackView, imageView])
        
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
    
    private func addTabBarGesture() {
        // 화면 클릭 시 로그인 화면
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        // 탭바 제스처 추가
        if let tabBar = self.tabBarController?.tabBar {
            let tabBarTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTabBarTap))
            tabBar.addGestureRecognizer(tabBarTapGesture)
        }
    }
    
    private func removeTabBarGesture() {
        // 탭바 제스처 제거
        if let tabBar = self.tabBarController?.tabBar {
            for gesture in tabBar.gestureRecognizers ?? [] {
                if gesture is UITapGestureRecognizer {
                    tabBar.removeGestureRecognizer(gesture)
                }
            }
        }
    }
    
    // MARK: 탭 이벤트
    @objc private func handleTap() {
        if store.isLogin {
            // 로그인 된 상태에서는 동작X
            return
        } else {
            // 로그인이 안된 상태
            let nextViewController = LoginViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
    
    @objc private func handleTabBarTap() {
        if store.isLogin {
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
