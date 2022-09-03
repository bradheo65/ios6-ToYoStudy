//
//  ViewController.swift
//  CoreGraphics_Sample_Cub
//
//  Created by Derrick kim on 9/3/22.
//

import UIKit

class ViewController: UIViewController {

    private let cubView: CubView = {
        let view = CubView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cubView)
        
        NSLayoutConstraint.activate([
            cubView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cubView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cubView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
