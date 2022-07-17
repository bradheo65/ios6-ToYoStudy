//
//  ViewController.swift
//  Sample_CollectionView
//
//  Created by Derrick kim on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sampleCollectionView: UICollectionView!
    // 별도의 이모지를 추가해도 좋습니다.
    private let emojies = ["1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleCollectionView.delegate = self
        sampleCollectionView.dataSource = self
        let mosaicLayout = MosaicLayout()
        sampleCollectionView.collectionViewLayout = mosaicLayout
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.numberlabel.text = emojies[indexPath.row]
        cell.backgroundColor = .yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 10 - 10,
                      height: (view.frame.width / 3) - 10)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected section: \(indexPath.section) and row: \(indexPath.row)")
    }
}
