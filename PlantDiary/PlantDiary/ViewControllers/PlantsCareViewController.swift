//
//  PlantsCareViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

enum Month: String, CaseIterable {
    case january = "일월이"
    case february = "이월이"
    case march = "삼월이"
    case april = "사월이"
    case may = "오월이"
    case june = "유월이"
    case july = "칠월이"
    case august = "팔월이"
    case september = "구월이"
    case october = "시월이"
    case november = "십일월이"
    case december = "십이월이"
}

class PlantsCareViewController: BaseViewController {
    private var verticalSpacing: CGFloat = 60
    private let horizontalSpacing: CGFloat = 30
    private var years: [Int] = [Int](2024...9999)
    private var currentYearIndex = 0
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("◀︎", for: .normal)
        button.setTitleColor(.baseColor, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.decreaseYear()
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: fontName, size: 20)
        label.textColor = .baseColor
        
        let yearFormat = DateFormatter()
        yearFormat.dateFormat = "YYYY"
        
        label.text = "\(yearFormat.string(from: Date()))년"
        
        return label
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("▶︎", for: .normal)
        button.setTitleColor(.baseColor, for: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.increaseYear()
        }, for: .touchUpInside)
        
        return button
    }()
    
    private lazy var hstackView : UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 15
        
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .baseColor2
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeftGestureReconizer = UISwipeGestureRecognizer(target: self, action: #selector(increaseYear))
        swipeLeftGestureReconizer.direction = .left
        collectionView.addGestureRecognizer(swipeLeftGestureReconizer)
        
        let swipeRightGestureReconizer = UISwipeGestureRecognizer(target: self, action: #selector(decreaseYear))
        swipeRightGestureReconizer.direction = .right
        collectionView.addGestureRecognizer(swipeRightGestureReconizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        hstackView.addArrangedSubviews([leftButton, yearLabel, rightButton])
        view.addSubviews([hstackView, collectionView])
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            yearLabel.heightAnchor.constraint(equalToConstant: 50),
            
            leftButton.heightAnchor.constraint(equalToConstant: 50),
            leftButton.widthAnchor.constraint(equalToConstant: 50),
            
            rightButton.heightAnchor.constraint(equalToConstant: 50),
            rightButton.widthAnchor.constraint(equalToConstant: 50),
            
            hstackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hstackView.heightAnchor.constraint(equalToConstant: 20),
            hstackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            collectionView.topAnchor.constraint(equalTo: hstackView.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    @objc func decreaseYear() {
        if currentYearIndex > 0 {
            currentYearIndex -= 1
            animateCollectionView()
            yearLabel.text = "\(years[currentYearIndex])년"
            updateCollectionViewForCurrentYear()
        }
    }
    
    @objc func increaseYear() {
        if currentYearIndex < years.count - 1 {
            currentYearIndex += 1
            animateCollectionView()
            yearLabel.text = "\(years[currentYearIndex])년"
            updateCollectionViewForCurrentYear()
        }
    }
    
    func updateCollectionViewForCurrentYear() {
        collectionView.reloadData()
    }
    
    func animateCollectionView() {
        let transitionOptions: UIView.AnimationOptions = .transitionCrossDissolve
        
        UIView.transition(with: collectionView, duration: 0.5, options: transitionOptions, animations: {
            self.collectionView.reloadData()
        }, completion: nil)
    }
}

extension PlantsCareViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Month.allCases.count
    }
    
    // TODO: 월별 기른 식물 이미지 넣어주기 - 나중엔 사용자가 월별 식물 이름을 붙여줄 수 있어도 좋을거 같아요 ex) 일월이, 새싹이 ...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        for subview in cell.subviews {
            subview.removeFromSuperview()
        }
        
        let stackView: UIStackView = UIStackView()
        
        stackView.frame = cell.bounds
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        let imageView = UIImageView()
        
        // 데이터 있는 경우에만 이미지 띄워주고 나머진 Questionmark로 구분
        // 4월에만 데이터 있다고 가정할게요!
        // 추후엔 데이터 유무로 분기처리
        if indexPath.row == 3 && yearLabel.text == "2024년" {
            imageView.image = UIImage(named: "DummyPlant")
        } else if indexPath.row == 5 && yearLabel.text == "2025년"{
            imageView.image = UIImage(named: "WitherPlant")
        } else {
            imageView.image = UIImage(systemName: "leaf.fill")
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.lightGray
        
        let label = UILabel()
        
        label.text = Month.allCases[indexPath.row].rawValue
        label.font = UIFont(name: fontName, size: 15)
        label.textColor = .baseColor
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        cell.addSubview(stackView)
        cell.layer.cornerRadius = 20
        cell.backgroundColor = .baseColor2
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let plantDiaryViewController = PlantDiaryViewController()
        plantDiaryViewController.month = Month.allCases[indexPath.row]
        // 데이터가 있는 경우 각 일지를 띄워준다
        // 4월에만 데이터 있다고 가정할게요!
        // 추후엔 데이터 유무로 분기처리
        if indexPath.row == 3 || indexPath.row == 6 && yearLabel.text == "2024년" {
            plantDiaryViewController.modalPresentationStyle = .pageSheet
            self.present(plantDiaryViewController, animated: true)
        } else if indexPath.row == 5 && yearLabel.text == "2025년"{
            plantDiaryViewController.modalPresentationStyle = .pageSheet
            self.present(plantDiaryViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - (4 * horizontalSpacing)) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return horizontalSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return verticalSpacing
    }
}


#Preview {
    PlantsCareViewController()
}
