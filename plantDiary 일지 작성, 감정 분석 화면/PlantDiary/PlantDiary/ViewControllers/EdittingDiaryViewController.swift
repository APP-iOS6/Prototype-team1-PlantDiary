//
//  EdittingDiaryViewController.swift
//  PlantDiary
//
//  Created by Juno Lee on 8/27/24.
//

import UIKit

class EdittingDiaryViewController: UIViewController, UITextViewDelegate, UIPickerViewDelegate,UIPickerViewDataSource {
    
    
   
    
    
    private let textView = UITextView()
    private let placeholderLabel = UILabel()
    private let saveButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)
    private let emotionPicker = UIPickerView()
    
    private let emotions = ["😁","😭","🥺","😡","😐"]
    private var selectedEmotion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        textView.delegate = self
        emotionPicker.delegate = self
        emotionPicker.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        // 제목 추가
        let titleLabel = UILabel()
        titleLabel.text = "일지 작성"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        // 플레이스 홀더
        placeholderLabel.text = "여기에 일지를 작성하세요."
        placeholderLabel.font = UIFont.systemFont(ofSize: 16)
        placeholderLabel.textColor = .lightGray
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.addSubview(placeholderLabel)
        
        // 텍스트 뷰
        textView.backgroundColor = UIColor.systemBackground
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        // 감정 피커
        emotionPicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emotionPicker)
        
        // 저장 버튼 설정
        saveButton.setTitle("저장", for: .normal)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        // 취소 버튼 설정
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelButton)
        
        // 오토 레이아웃 설정
        NSLayoutConstraint.activate([
            
            // 제목 레이블
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 텍스트 뷰
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20),
            
            //플레이스홀더 설정
            placeholderLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: 8),
            placeholderLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 5),
            placeholderLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor, constant: -5),
            
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
        updatePlaceholderVisibilty()
    }
    
    private func updatePlaceholderVisibilty() {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    @objc private func save() {
        let alert = UIAlertController(title: nil, message: "저장 할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            // 저장 기능 자리
            
            
            let confirmationAlert = UIAlertController(title: nil, message: "저장 되었습니다!", preferredStyle: .alert)
            confirmationAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(confirmationAlert, animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func cancel() {
        let alert = UIAlertController(title: nil, message: "일지 작성을 취소 할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func textViewDidChange( _ textView: UITextView) {
        updatePlaceholderVisibilty()
    }
    
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
