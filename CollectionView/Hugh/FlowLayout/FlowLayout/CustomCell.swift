//
//  CustomCell.swift
//  FlowLayout
//
//  Created by dhoney96 on 2022/07/16.
//

import UIKit

class CustomCell: UICollectionViewCell {
    static let id: String = "CustomCell"
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
