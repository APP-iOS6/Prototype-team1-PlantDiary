//
//  EdittingDiaryViewController.swift
//  PlantDiary
//
//  Created by Juno Lee on 8/27/24.
//

import UIKit

class EdittingDiaryViewController: BaseViewController {
    private let emotions = ["#기쁨", "#슬픔", "#우울함", "#화남", "#평범함"]
    private var selectedEmotion: String?
    public var addDiary: (() -> ())?

//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        
//        label.text = "당신의 오늘은 어땠나요?"
//        label.font = UIFont(name: fontName, size: 18)
//        label.textColor = .baseColor
//        label.textAlignment = .left
//        
//        return label
//    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.backgroundColor = UIColor.systemBackground
        textView.delegate = self
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "Diary")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.borderColor = UIColor.baseColor.cgColor
        imageView.layer.borderWidth = 2
        
        return imageView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        
        label.text = "당신의 오늘은 어땠나요?"
        label.font = UIFont(name: fontName, size: 16)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("저장", for: .normal)
        button.setTitleColor(.baseColor, for: .normal)
        button.titleLabel?.font = UIFont(name: fontName, size: 18)
        button.setTitleColor(.baseColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            self?.addDiary?()
            self?.dismiss(animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.cancelColor, for: .normal)
        button.titleLabel?.font = UIFont(name: fontName, size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: "일기 쓰기 취소", message: "취소를 하시면 작성하시던 일지 내용이 삭제돼요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel))
            alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
                self?.dismiss(animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var emotionPicker: UIPickerView = {
        let picker = UIPickerView()
        
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlaceholderVisibility()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        hStackView.addArrangedSubviews([cancelButton, saveButton])
        
        view.addSubviews([hStackView, placeholderLabel, textView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            hStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            hStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            
            textView.topAnchor.constraint(equalTo: hStackView.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
        ])
    }
    
    private func updatePlaceholderVisibility() {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
}

extension EdittingDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderVisibility()
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        style.paragraphSpacing = 12

        let attributedString = NSMutableAttributedString(string: textView.text)
        
        attributedString.addAttributes([.font: UIFont(name: fontName, size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .semibold), .foregroundColor: UIColor.black, .kern: CGFloat(2.0), .paragraphStyle: style], range: NSRange(location: 0, length: attributedString.length))
        
        textView.attributedText = attributedString
    }
}

extension EdittingDiaryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emotions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = emotions[row]
        label.font = UIFont(name: fontName, size: 18)
        label.textAlignment = .center
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedEmotion = emotions[row]
    }
}

#Preview {
    EdittingDiaryViewController()
}
