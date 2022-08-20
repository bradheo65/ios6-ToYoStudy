//
//  ViewController.swift
//  ErrorYagom
//
//  Created by 허건 on 2022/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    let yagomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "yagom")
        // imageView.contentMode = .scaleAspectFit
        // imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        return imageView
    }()
    
    let errorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("에러를 만난 야곰", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(tappedErrorButton), for: .touchUpInside)
        return button
    }()
    
    let newMacBookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("새 맥북을 구매한 야곰", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(tappedNewMacBookButton), for: .touchUpInside)
        return button
    }()
    
    let customButton: UIButton = {
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
        button.addTarget(self, action: #selector(tappedResetButton), for: .touchUpInside)
        return button
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(yagomImageView)
        view.addSubview(buttonStackView)
        setImageView()
        setStackView()
    }
    
    private func setImageView() {
        NSLayoutConstraint.activate([
            yagomImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            yagomImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            yagomImageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            yagomImageView.widthAnchor.constraint(equalTo: yagomImageView.heightAnchor)
        ])
    }
    
    private func setStackView() {
        [errorButton, newMacBookButton, customButton, resetButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: yagomImageView.bottomAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func tappedErrorButton() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.yagomImageView.frame.origin.x -= 10
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.yagomImageView.frame.origin.x += 10
            }
        }
    }
    
    @objc func tappedNewMacBookButton() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.yagomImageView.bounds.size.height += 150
                self.yagomImageView.bounds.size.width -= 150
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.yagomImageView.bounds.size.height -= 150
                self.yagomImageView.bounds.size.width += 150
            }
        }
    }
    
    @objc func tappedResetButton() {
        yagomImageView.layer.removeAllAnimations()
    }
}

