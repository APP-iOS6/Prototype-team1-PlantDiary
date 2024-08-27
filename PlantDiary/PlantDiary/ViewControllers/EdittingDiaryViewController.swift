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

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "당신의 오늘은 어떠셨나요?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .baseColor
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
        textView.backgroundColor = UIColor.systemBackground
        textView.delegate = self
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        
        imageView.image = UIImage(named: "일기장")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.borderColor = UIColor.baseColor.cgColor
        imageView.layer.borderWidth = 2
        
        return imageView
    }()
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        
        label.text = "감정노트에요."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "square.and.arrow.down.on.square")
        let resizeImage = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        
        button.setImage(resizeImage, for: .normal)
        button.tintColor = .baseColor
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: nil, message: "저장 할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel))
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                let confirmationAlert = UIAlertController(title: nil, message: "저장 되었습니다!", preferredStyle: .alert)
                confirmationAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    self?.dismiss(animated: true, completion: nil)
                }))
                self?.present(confirmationAlert, animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "xmark")
        let resizeImage = image?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30))
        
        button.setImage(resizeImage, for: .normal)
        button.tintColor = .baseColor
        button.setTitleColor(.systemRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: nil, message: "일지 작성을 취소 할까요?", preferredStyle: .alert)
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
        
        hStackView.addArrangedSubviews([emotionPicker, saveButton, cancelButton])
        
        view.addSubviews([titleLabel, imageView, textView, placeholderLabel, hStackView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            textView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            
            emotionPicker.widthAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5),
            emotionPicker.heightAnchor.constraint(equalToConstant: 60),
            
            hStackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            hStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            hStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        label.font = UIFont.systemFont(ofSize: 17)
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
