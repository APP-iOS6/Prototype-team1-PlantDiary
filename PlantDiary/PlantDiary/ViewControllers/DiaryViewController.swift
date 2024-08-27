//
//  DiaryViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

enum SegmentFlag: String {
    case diary = "Diary"
    case sentiment = "Sentiment"
}

class DiaryViewController: BaseViewController {
    
    private var segmentFlag: String = SegmentFlag.diary.rawValue
    private var selectedDate: DateComponents? = nil
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["일기 관리", "감정 분석 관리"])
        segmentedControl.layer.cornerRadius = 10
        segmentedControl.layer.masksToBounds = true
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addAction(UIAction { [weak self] _ in
            if segmentedControl.selectedSegmentIndex == 0 {
                self?.segmentFlag = SegmentFlag.diary.rawValue
            } else {
                self?.segmentFlag = SegmentFlag.sentiment.rawValue
            }
        }, for: .allEvents)
        // 선택된 상태의 텍스트 색상
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.baseColor,
            .font: UIFont(name: fontName, size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
        ]
        
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.baseColor,
            .font: UIFont(name: fontName, size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .semibold)
        ]
        
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        return segmentedControl
    }()
    
    private var subView: UIView = {
        let view = UIView()
                
        return view
    }()
    
    private lazy var todayDateLabel: UILabel = {
        let label = UILabel()
        
        let yearFormatter = DateFormatter()
        let monthDayFormatter = DateFormatter()
        yearFormatter.dateFormat = "yyyy년"
        monthDayFormatter.dateFormat = "MM월 dd일"
        let yearString = yearFormatter.string(from: Date())
        let monthDayString = monthDayFormatter.string(from: Date())
        label.text = """
                    오늘은
                    \(yearString)
                    \(monthDayString)이에요.
                    """
        label.numberOfLines = 0
        label.font = UIFont(name: fontName, size: 35)
        label.textColor = .baseColor
        
        return label
    }()
    
    private lazy var dateView: UICalendarView = {
        let dateView = UICalendarView()
        
        dateView.wantsDateDecorations = true
        dateView.tintColor = .baseColor
        
        return dateView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCalendar()
        reloadDateView(date: Date())
        segmentedControl.selectedSegmentIndex = 0
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        vStackView.addArrangedSubviews([todayDateLabel, dateView])
        
        subView.addSubview(vStackView)
        
        view.addSubviews([subView, segmentedControl])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            
            subView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 20),
            subView.centerYAnchor.constraint(equalTo: safeGuide.centerYAnchor, constant: 20),
            subView.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: 100), 
            
            vStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 20),
            vStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -20),
            vStackView.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            vStackView.widthAnchor.constraint(equalTo: subView.widthAnchor),
            vStackView.topAnchor.constraint(equalTo: subView.topAnchor),
            vStackView.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
        ])
    }
    
    fileprivate func setCalendar() {
        dateView.delegate = self
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: self)
        dateView.selectionBehavior = dateSelection
    }
    
    func reloadDateView(date: Date?) {
        if date == nil { return }
        let calendar = Calendar.current
        dateView.reloadDecorations(forDateComponents: [calendar.dateComponents([.day, .month, .year], from: date!)], animated: true)
    }
}

extension DiaryViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selection.setSelected(dateComponents, animated: true)
        selectedDate = dateComponents
        reloadDateView(date: Calendar.current.date(from: dateComponents!))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            selection.setSelected(nil, animated: true)
        }
        
        if segmentFlag == SegmentFlag.diary.rawValue {
            let edittingDiaryViewController = EdittingDiaryViewController()
            
            edittingDiaryViewController.modalPresentationStyle = .formSheet
            present(edittingDiaryViewController, animated: true)
        } else {
            let sentimentAnalysisViewController = SentimentAnalysisViewController()
            
            sentimentAnalysisViewController.modalPresentationStyle = .formSheet
            present(sentimentAnalysisViewController, animated: true)
        }
    }
}



#Preview {
    DiaryViewController()
}
