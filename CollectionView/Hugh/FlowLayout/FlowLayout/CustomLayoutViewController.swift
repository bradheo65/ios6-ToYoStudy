//
//  CustomLayoutViewController.swift
//  FlowLayout
//
//  Created by dhoney96 on 2022/07/23.
//

import UIKit

class CustomLayoutViewController: UIViewController {
    var collectionView: UICollectionView! = nil
    let emojies = ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟", "🔢"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollectionView()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.id)
        configureCollectionView()
    }
    
    func createCollectionView() {
        let customLayout = CustomLayout()
        
        collectionView = .init(frame: .zero, collectionViewLayout: customLayout)
    }
    
    func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

extension CustomLayoutViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.id, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .yellow
        cell.label.text = "\(emojies[indexPath.row])"
        
        return cell
    }
}

//extension CustomLayoutViewController: CustomLayoutDelegate {
//    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
//        return emojies[indexPath.item].contentHeightSize
//    }
//}
