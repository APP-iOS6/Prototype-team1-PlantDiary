//
//  HomeViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class HomeViewController: CommonViewController {
    
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
        stackView.axis = .vertical
        stackView.spacing = 10.5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func setupSubviews() {
        view.addSubview(label)
        view.addSubview(imageView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            // 라벨은 상단
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            // 이미지는 화면 중앙에 배치
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }
}

#Preview {
    HomeViewController()
}
