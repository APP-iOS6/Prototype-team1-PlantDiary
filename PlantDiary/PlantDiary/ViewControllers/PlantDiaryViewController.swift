//
//  PlantDiaryViewController.swift
//  PlantDiary
//
//  Created by 이소영 on 8/27/24.
//

import UIKit

class PlantDiaryViewController: BaseViewController {
    // 프로토 타입용 데이터
    var month: Month = Month.april
    private let data = [Month.april : "DummyPlant", Month.june : "WitherPlant"]

    private lazy var label: UILabel = {
        let label: UILabel = UILabel()
        
        label.text = month.rawValue
        label.font = UIFont(name: fontName, size: 18)
        label.textColor = .baseColor
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: data[month] ?? "DummyPlant")
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
        textView.text = if month == .april {
            """
             이번 달은 \(month.rawValue)가 파릇파릇 기분이 좋아보이네요!!
             앞으로도 \(month.rawValue)의 매일이 행복한 하루였으면 좋겠어요.
             아침은 희망의 시작이란 말이 있어요. 햇살이 부드럽게 스며드는 아침, 따듯한 인사로 하루를 기분 좋게 시작해봐요. 아침의 인사가 당신에게 전해지는 힘이 되길 바라요.
            """
        } else {
            """
             이번 달은 \(month.rawValue)가 기운이 없네요...
             운동이나 여가, 취미활동 등 즐거움을 얻을 수 있는 다양한 활동을 해보는 것이 좋을 것 같아요.
             매일매일 한시간 이상 야외에서 걸으면 기분을 좋게하는 호르몬인 도파민, 세로토닌 활성도가 높아져서 우울감 완화에 도움이 되고 햇볕을 쬐면 더욱 효과가 좋대요.
             자고 일어나는 시간을 규칙적으로 가져야 불면증이 생기지 않고, 충분한 수면을 취하는 것이 우울감 완화에 도움이 돼요.
            """
        }
        textView.textColor = .baseColor
        textView.font = .systemFont(ofSize: 10)
        textView.textContainerInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        style.paragraphSpacing = 12

        let attributedString = NSMutableAttributedString(string: textView.text)
        
        attributedString.addAttributes([.font: UIFont(name: fontName, size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.baseColor2, .kern: CGFloat(2.0), .paragraphStyle: style], range: NSRange(location: 0, length: attributedString.length))
        
        textView.attributedText = attributedString
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = month.rawValue
        imageView.image = UIImage(named: data[month] ?? "DummyPlant")
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
