//
//  EdittingDiaryViewController.swift
//  PlantDiary
//
//  Created by Juno Lee on 8/27/24.
//

import UIKit

class EdittingDiaryViewController: BaseViewController {
    private let emotions = ["😁","😭","🥺","😡","😐"]
    private var selectedEmotion: String?
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        
//        textView.addSubview(placeholderLabel)
        textView.backgroundColor = UIColor.systemBackground
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
//    private lazy var placeholderLabel: UILabel = {
//        let label = UILabel()
//        
//        let placeholderLabel = UILabel()
//        
//        placeholderLabel.text = "여기에 일지를 작성하세요."
//        placeholderLabel.font = UIFont.systemFont(ofSize: 16)
//        placeholderLabel.textColor = .lightGray
//        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        return label
//    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.text = "일지 작성"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private lazy var saveButton: UIButton = {
        let saveButton = UIButton()
        
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: nil, message: "저장 할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel))
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                // 저장 기능 자리
                let confirmationAlert = UIAlertController(title: nil, message: "저장 되었습니다!", preferredStyle: .alert)
                confirmationAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                    self?.dismiss(animated: true, completion: nil)
                }))
                self?.present(confirmationAlert, animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return saveButton
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.addAction(UIAction { [weak self] _ in
            let alert = UIAlertController(title: nil, message: "일지 작성을 취소 할까요?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "취소", style: .cancel))
            alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
                self?.dismiss(animated: true, completion: nil)
            }))
            self?.present(alert, animated: true, completion: nil)
        }, for: .touchUpInside)
        
        return cancelButton
    }()
    
    private lazy var emotionPicker: UIPickerView = {
        let picker = UIPickerView()
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        textView.delegate = self
        emotionPicker.delegate = self
        emotionPicker.dataSource = self
        
        // updatePlaceholderVisibilty()
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.backgroundColor = .systemBackground
        
        view.addSubviews([titleLabel, textView, emotionPicker, saveButton, cancelButton])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            // 제목 레이블
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 텍스트 뷰
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            //플레이스홀더 설정
//            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
//            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5),
//            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            
            // 감정 피커
            emotionPicker.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: -50),
            emotionPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            emotionPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90),
            emotionPicker.heightAnchor.constraint(equalToConstant: 150),
            
            // 저장 버튼
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            
            // 취소 버튼
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
//    private func updatePlaceholderVisibilty() {
//        placeholderLabel.isHidden = !textView.text.isEmpty
//    }
}

extension EdittingDiaryViewController: UITextViewDelegate {
    func textViewDidChange( _ textView: UITextView) {
//        updatePlaceholderVisibilty()
    }
}

extension EdittingDiaryViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emotions.count
    }
    
    func pickerView( _ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = emotions[row]
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedEmotion = emotions[row]
    }
}

#Preview {
    EdittingDiaryViewController()
}
