//
//  CustomView.swift
//  ViewAnimationChallenge
//
//  Created by 이원빈 on 2022/08/20.
//

import UIKit

class CustomView: UIView {
    let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    var imageHeight: NSLayoutConstraint!
    var imageWidth: NSLayoutConstraint!
    let yagomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "yagom")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    let errorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("에러를 만난 야곰", for: .normal)
        button.backgroundColor = .systemRed
        
        return button
    }()
    let newMacbookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("새 맥북을 구매한 야곰", for: .normal)
        button.backgroundColor = .systemGreen
        
        return button
    }()
    let CustomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Custom", for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("되돌리기", for: .normal)
        button.backgroundColor = .systemGray
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setAddSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAddSubviews() {
        self.addSubview(yagomImageView)
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(errorButton)
        mainStackView.addArrangedSubview(newMacbookButton)
        mainStackView.addArrangedSubview(CustomButton)
        mainStackView.addArrangedSubview(resetButton)
    }
    
    private func setConstraints() {
        imageHeight = yagomImageView.heightAnchor.constraint(equalToConstant: 300)
        imageWidth = yagomImageView.widthAnchor.constraint(equalToConstant: 300)
        
        imageWidth.isActive = true
        imageHeight.isActive = true
        yagomImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        yagomImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: yagomImageView.bottomAnchor, constant: 100).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
    }
}
