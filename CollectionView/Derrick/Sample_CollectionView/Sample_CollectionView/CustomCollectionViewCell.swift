//
//  CustomCollectionViewCell.swift
//  Sample_CollectionView
//
//  Created by Derrick kim on 2022/07/16.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberlabel: UILabel!
    
    override func prepareForReuse() {
        numberlabel.text = nil
    }
}
