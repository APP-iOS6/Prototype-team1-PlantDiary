//
//  SentimentAnalysisViewController.swift
//  PlantDiary
//
//  Created by Juno Lee on 8/27/24.
//

import UIKit

class SentimentAnalysisViewController: BaseViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "감정 상태 분석 결과"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = """
        가벼운 우울감을
        겪고 있는 상태이며,
        우울증 예방을 위해
        운동이나 여가 및 취미활동 등
        즐거움을 얻을 수 있는
        다양한 활동에 적극적으로
        참여해보는 것이 좋습니다.
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("뒤로가기", for: .normal)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, resultLabel, backButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupLayout()
    }

    override func setupSubviews() {
        view.addSubview(stackView)
    }
    
    override func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func back() {
        dismiss(animated: true, completion: nil)
    }
}

#Preview {
    SentimentAnalysisViewController()
}
