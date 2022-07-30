//
//  MainViewController.swift
//  view-related-Notifications
//
//  Created by Derrick kim on 2022/07/30.
//

import UIKit

class MainViewController: UIViewController {
//    override func loadView() {
//        view = CustomView()
//    }
    
    override func viewDidLoad() {
        print("💻 MainViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("💻 MainViewController - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("💻 MainViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("💻 MainViewController - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("💻 MainViewController - viewDidDisappear")
    }
}

class CustomView: UIView {
    let moveToNextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("CustomView")
        
        addSubview(moveToNextButton)
        backgroundColor = .white
        moveToNextButton.addTarget(self, action: #selector(didTappedButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            moveToNextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            moveToNextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            moveToNextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        ])
    }
    
    @objc func didTappedButton(_ sender: UIButton) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

