//
//  DiaryViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

class DiaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let showEditSheetButton = UIButton(type: .system)
        showEditSheetButton.setTitle("일지 작성하기", for: .normal)
        showEditSheetButton.addTarget(self, action: #selector(showEditDiarySheet), for: .touchUpInside)
        
        let showAnalysisSheetButton = UIButton(type: .system)
        showAnalysisSheetButton.setTitle("감정 분석 결과", for: .normal)
        showAnalysisSheetButton.addTarget(self, action: #selector(showSentimentAnalysisSheet), for: .touchUpInside)


        view.addSubview(showEditSheetButton)
        showEditSheetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showEditSheetButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            showEditSheetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        view.addSubview(showAnalysisSheetButton)
        showAnalysisSheetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showAnalysisSheetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showAnalysisSheetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showEditDiarySheet() {
        let EditDiaryVC = EdittingDiaryViewController()
        let navigationController = UINavigationController(rootViewController: EditDiaryVC)
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }
    @objc private func showSentimentAnalysisSheet() {
        let AnalysisVC = SentimentAnalysisViewController()
        let navigationController = UINavigationController(rootViewController: AnalysisVC)
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }
}

#Preview {
    DiaryViewController()
}
