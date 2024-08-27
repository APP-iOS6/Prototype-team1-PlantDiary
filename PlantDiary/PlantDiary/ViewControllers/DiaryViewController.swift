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

class DiaryViewController: UIViewController {
    
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
        
        return segmentedControl
    }()
    
    private var subView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var todayDateLabel: UILabel = {
        let label = UILabel()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let dateToString = dateFormatter.string(from: Date())
        label.text = dateToString
        
        return label
    }()
    
    private lazy var dateView: UICalendarView = {
        let dateView = UICalendarView()
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.wantsDateDecorations = true
        
        return dateView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        setCalendar()
        reloadDateView(date: Date())
        setupUI()
        setupLayout()
        
        segmentedControl.selectedSegmentIndex = 0
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
    
    func setupUI() {
        vStackView.addArrangedSubviews([todayDateLabel, dateView])
        subView.addSubview(vStackView)
        
        view.addSubviews([segmentedControl, subView])
    }
    
    func setupLayout() {
        let safeGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: safeGuide.centerXAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: subView.topAnchor, constant: -70),
            
            subView.centerYAnchor.constraint(equalTo: safeGuide.centerYAnchor, constant: 20),
            
            vStackView.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            vStackView.widthAnchor.constraint(equalTo: subView.widthAnchor),
            vStackView.topAnchor.constraint(equalTo: subView.topAnchor),
            vStackView.bottomAnchor.constraint(equalTo: subView.bottomAnchor),
        ])
    }
}

extension DiaryViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {

//    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
//        if let selectedDate = selectedDate, selectedDate == dateComponents {
//            return .customView {
//                let label = UILabel()
//                label.text = "🐶"
//                label.textAlignment = .center
//                return label
//            }
//        }
//        return nil
//    }
//
    
    // 달력에서 날짜 선택했을 경우
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        selection.setSelected(dateComponents, animated: true)
        selectedDate = dateComponents
        reloadDateView(date: Calendar.current.date(from: dateComponents!))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            selection.setSelected(nil, animated: true)
            
            print("test")
        }
        
        if segmentFlag == SegmentFlag.diary.rawValue {
            // 시트 띄우기
            let test = PlantsCareViewController()
            
            test.modalPresentationStyle = .formSheet
            present(test, animated: true)
        } else {
            let test = PlantsCareViewController()
            
            test.modalPresentationStyle = .formSheet
            present(test, animated: true)
        }
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

#Preview {
    DiaryViewController()
}
