//
//  PlantDiaryViewController.swift
//  PlantDiary
//
//  Created by 이소영 on 8/27/24.
//

import UIKit

class PlantDiaryViewController: BaseViewController {
    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = Month.april.rawValue
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .baseColor
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "식물이")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.baseColor.cgColor
        
        return imageView
    }()
    
    private lazy var textView: UITextView = {
        let textView: UITextView = UITextView()
        
        textView.backgroundColor = .baseColor
        textView.layer.cornerRadius = 10
        textView.isEditable = false
        textView.textAlignment = .left
        textView.text = """
         이번달은 \(Month.april.rawValue)가 기운이 없네요...
         운동이나 여가, 취미활동 등 즐거움을 얻을 수 있는 다양한 활동을 해보는 것이 좋을 것 같아요.
         매일매일 한시간 이상 야외에서 걸으면 기분을 좋게하는 호르몬인 도파민, 세로토닌 활성도가 높아져서 우울감 완화에 도움이 되고 햇볕을 쬐면 더욱 효과가 좋대요.
         자고 일어나는 시간을 규칙적으로 가져야 불면증이 생기지 않고, 충분한 수면을 취하는 것이 우울감 완화에 도움이 돼요.
        """
        textView.textColor = .baseColor
        textView.font = .systemFont(ofSize: 10)
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        style.paragraphSpacing = 12

        let attributedString = NSMutableAttributedString(string: textView.text)
        
        attributedString.addAttributes([.font: UIFont.systemFont(ofSize: 18, weight: .bold), .foregroundColor: UIColor.baseColor2, .kern: CGFloat(2.0), .paragraphStyle: style], range: NSRange(location: 0, length: attributedString.length))
        
        textView.attributedText = attributedString
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubviews([imageView, label, textView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.heightAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}

#Preview {
    PlantDiaryViewController()
}
