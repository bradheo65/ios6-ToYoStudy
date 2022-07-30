//
//  CustomView.swift
//  LifeCycleIntegrationDemo
//
//  Created by 이원빈 on 2022/07/30.
//

import UIKit

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
