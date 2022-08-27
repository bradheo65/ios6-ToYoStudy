//
//  ViewController.swift
//  ViewAnimation
//
//  Created by Derrick kim on 2022/08/27.
//

import UIKit

class ViewController: UIViewController {
    private let yagomImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.image = UIImage(named: "yagom")
        return imageview
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private let errorYagomButton: UIButton = {
        let button = UIButton()
        button.setTitle("에러를 만난 야곰", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let newMacbookYagomButton: UIButton = {
        let button = UIButton()
        button.setTitle("새 맥북을 구매한 야곰", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let customYagomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let returnYagomButton: UIButton = {
        let button = UIButton()
        button.setTitle("되돌리기", for: .normal)
        button.backgroundColor = .gray
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefault()
        setupButtonTarget()
    }
    
    func setupDefault() {
        self.view.backgroundColor = .white
        self.view.addSubview(yagomImageView)
        self.view.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(errorYagomButton)
        buttonStackView.addArrangedSubview(newMacbookYagomButton)
        buttonStackView.addArrangedSubview(customYagomButton)
        buttonStackView.addArrangedSubview(returnYagomButton)
        
        NSLayoutConstraint.activate([
            yagomImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            yagomImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            yagomImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            yagomImageView.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
            
            buttonStackView.topAnchor.constraint(equalTo: yagomImageView.bottomAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }
    
    func setupButtonTarget() {
        errorYagomButton.addTarget(self,
                                   action: #selector(didTappedErrorButton),
                                   for: .touchUpInside)
        newMacbookYagomButton.addTarget(self,
                                   action: #selector(didTappedNewMacbookButton),
                                   for: .touchUpInside)
        customYagomButton.addTarget(self,
                                   action: #selector(didTappedCustomButton),
                                   for: .touchUpInside)
        returnYagomButton.addTarget(self,
                                   action: #selector(didTappedReturnButton),
                                   for: .touchUpInside)
    }
    
    @objc private func didTappedErrorButton() {
        UIView.animateKeyframes(withDuration: 0.05, delay: 0, options: [.allowUserInteraction, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.yagomImageView.frame.origin.x -= 10
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
                self.yagomImageView.frame.origin.x += 10
                
            }
        } completion: { isFinished in
        }
    }
    
    @objc private func didTappedNewMacbookButton() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.allowUserInteraction, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.yagomImageView.bounds.size.width -= 100
                self.yagomImageView.bounds.size.height += 100
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
                self.yagomImageView.bounds.size.width += 100
                self.yagomImageView.bounds.size.height -= 100
            }
        } completion: { isFinished in
        }
    }
    
    @objc private func didTappedCustomButton() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.allowUserInteraction]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.yagomImageView.transform = CGAffineTransform(rotationAngle: .pi )
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
                self.yagomImageView.transform = CGAffineTransform(rotationAngle: .pi * -2)
            }
        } completion: { isFinished in
        }
    }
    
    @objc private func didTappedReturnButton() {
        self.yagomImageView.layer.removeAllAnimations()
    }
}

