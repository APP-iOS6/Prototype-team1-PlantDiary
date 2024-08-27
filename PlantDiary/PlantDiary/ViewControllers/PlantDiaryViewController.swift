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
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        
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
    
    private lazy var textView: UITextView = {
        let textView: UITextView = UITextView()
        
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 10
        textView.isEditable = false
        textView.textAlignment = .left
        textView.text = """
            이번달은 \(Month.april.rawValue)이/가 기운이 없네요...
        운동이나 여가, 취미활동 등 즐거움을 얻을 수 있는 다양한 활동을 해보는 것이 좋습니다.
        매일매일 한시간 이상 야외에서 걸으면 기분을 좋게하는 호르몬인 도파민, 세로토닌 활성도가 높아져서 우울감 완화에 도움이 되고 햇볕을 쬐면 더욱 효과가 좋습니다.
        자고 일어나는 시간을 규칙적으로 가져야 불면증이 생기지 않으며 충분한 수면을 취하는 것이 우울감 완화에 도움이 됩니다.
        """
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10

        let attributedString = NSMutableAttributedString(string: textView.text)

        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(2.0), range: NSRange(location: 0, length: attributedString.length))
        
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 25), range: NSRange(location: 0, length: attributedString.length))

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        
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
        
        view.backgroundColor = .systemBackground
        
        view.addSubviews([label, imageView, textView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.heightAnchor.constraint(equalToConstant: view.bounds.width/4),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
}

#Preview {
    PlantDiaryViewController()
}
