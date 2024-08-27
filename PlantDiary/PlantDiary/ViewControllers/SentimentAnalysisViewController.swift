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
        
        label.text = "감정 분석 결과에요"
        label.textColor = .baseColor
        label.font = .systemFont(ofSize: 35, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        
        label.text = """
        가벼운 우울감을 겪고 있는 상태에요.
        우울증 예방을 위해서
        운동이나 여가 및 취미활동 등
        즐거움을 얻을 수 있는 
        다양한 활동에 적극적으로
        참여해보는 것이 좋을 것 같아요.
        """
        label.textColor = .baseColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        style.paragraphSpacing = 12
        style.alignment = .center

        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 18, weight: .bold), .foregroundColor: UIColor.baseColor, .paragraphStyle: style, ], range: NSRange(location: 0, length: attributedString.length))
        
        label.attributedText = attributedString
        
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        
        let image = UIImage(systemName: "arrow.clockwise")
        let resizeImage = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        
        button.setImage(resizeImage, for: .normal)
        button.tintColor = .baseColor
        button.addAction(UIAction { [weak self] _ in
            self?.back()
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, resultLabel, backButton])
        
        stackView.axis = .vertical
        stackView.spacing = 55
        stackView.alignment = .center
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubview(stackView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func back() {
        dismiss(animated: true, completion: nil)
    }
}

#Preview {
    SentimentAnalysisViewController()
}
