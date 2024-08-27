//
//  PlantsCareViewController.swift
//  PlantDiary
//
//  Created by Hyunwoo Shin on 8/27/24.
//

import UIKit

enum Month: String, CaseIterable {
    case january = "Jan"
    case february = "Feb"
    case march = "Mar"
    case april = "Apr"
    case may = "May"
    case june = "Jun"
    case july = "Jul"
    case august = "Aug"
    case september = "Sep"
    case october = "Oct"
    case november = "Nov"
    case december = "Dec"
}

class PlantsCareViewController: BaseViewController {
    private var verticalSpacing: CGFloat = 60
    private let horizontalSpacing: CGFloat = 30
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        
        view.addSubview(collectionView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension PlantsCareViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Month.allCases.count
    }
    
    // TODO: 월별 기른 식물 이미지 넣어주기 - 나중엔 사용자가 월별 식물 이름을 붙여줄 수 있어도 좋을거 같아요 ex) 일월이, 새싹이 ...
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        let stackView: UIStackView = UIStackView()
        
        stackView.frame = cell.bounds
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        
        let imageView = UIImageView()
        
        // 데이터 있는 경우에만 이미지 띄워주고 나머진 Questionmark로 구분
        // 4월에만 데이터 있다고 가정할게요!
        // 추후엔 데이터 유무로 분기처리
        if indexPath.row == 3 {
            imageView.image = UIImage(named: "식물이")
        } else {
            imageView.image = UIImage(systemName: "questionmark.bubble.fill")
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.lightGray
        
        let label = UILabel()
        
        label.text = Month.allCases[indexPath.row].rawValue
        label.font = .boldSystemFont(ofSize: 15)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        cell.addSubview(stackView)
        cell.layer.cornerRadius = 20
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let plantDiaryViewController = PlantDiaryViewController()
        
        // 데이터가 있는 경우 각 일지를 띄워준다
        // 4월에만 데이터 있다고 가정할게요!
        // 추후엔 데이터 유무로 분기처리
        if indexPath.row == 3 {
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
