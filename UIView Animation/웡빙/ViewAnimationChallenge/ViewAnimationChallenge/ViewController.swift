//
//  ViewController.swift
//  ViewAnimationChallenge
//
//  Created by 이원빈 on 2022/08/20.
//

import UIKit

class ViewController: UIViewController {
    var customView = CustomView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialView()
        configureCustomView()
        setButtonAction()
    }
    
    private func configureInitialView() {
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureCustomView() {
        view.addSubview(customView)
        customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setButtonAction() {
        customView.errorButton.addTarget(self, action: #selector(errorButtonDidTapped), for: .touchUpInside)
        customView.newMacbookButton.addTarget(self, action: #selector(newMacbookButtonDidTapped), for: .touchUpInside)
        customView.CustomButton.addTarget(self, action: #selector(CustomButtonDidTapped), for: .touchUpInside)
        customView.resetButton.addTarget(self, action: #selector(resetButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func errorButtonDidTapped() {
        UIView.animateKeyframes(withDuration: 0.05, delay: 0, options: [.allowUserInteraction, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.customView.yagomImageView.frame.origin.x -= 10
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
                self.customView.yagomImageView.frame.origin.x += 10
                
            }
        } completion: { isFinished in
            //
        }

    }
    @objc private func newMacbookButtonDidTapped() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.allowUserInteraction, .repeat]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
//                self.customView.imageWidth.constant -= 50
//                self.customView.imageHeight.constant += 50
//                self.view.layoutIfNeeded()
                self.customView.yagomImageView.bounds.size.width -= 100
                self.customView.yagomImageView.bounds.size.height += 100
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
//                self.customView.imageWidth.constant += 50
//                self.customView.imageHeight.constant -= 50
//                self.view.layoutIfNeeded()
                self.customView.yagomImageView.bounds.size.width += 100
                self.customView.yagomImageView.bounds.size.height -= 100
            }
        } completion: { isFinished in
            //
        }
    }
    @objc private func CustomButtonDidTapped() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.allowUserInteraction]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.customView.yagomImageView.transform = CGAffineTransform(rotationAngle: .pi )
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1) {
                self.customView.yagomImageView.transform = CGAffineTransform(rotationAngle: .pi * -2)
            }
        } completion: { isFinished in
            //
        }
    }
    @objc private func resetButtonDidTapped() {
        self.customView.yagomImageView.layer.removeAllAnimations()
    }
}

