//
//  MainView.swift
//  NSCacheDemo
//
//  Created by 이원빈 on 2022/07/24.
//

import UIKit

class MainView: UIView {
    
    let activitiIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.red
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
        return activityIndicator
    }()
    
    let upperImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let upperButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("첫 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .brown
        return button
    }()
    
    let lowerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let lowerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("두 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .systemRed
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이미지 초기화", for: .normal)
        button.backgroundColor = .systemGreen
        return button
    }()
    
    let clearCacheButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("캐시 비우기", for: .normal)
        button.backgroundColor = .systemGray
        return button
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [upperImageView, upperButton, lowerImageView, lowerButton, resetButton, clearCacheButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(verticalStackView)
        self.addSubview(activitiIndicator)
        activitiIndicator.frame.origin.x = 0
        activitiIndicator.frame.origin.y = 0
        activitiIndicator.frame.size.width = self.bounds.width
        activitiIndicator.frame.size.height = self.bounds.height
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            upperImageView.heightAnchor.constraint(equalToConstant: 200),
            upperImageView.widthAnchor.constraint(equalToConstant: 200),
            lowerImageView.heightAnchor.constraint(equalToConstant: 200),
            lowerImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
