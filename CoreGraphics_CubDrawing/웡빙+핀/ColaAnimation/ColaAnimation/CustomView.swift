//
//  CustomView.swift
//  ColaAnimation
//
//  Created by 이원빈 on 2022/09/03.
//

import UIKit

class CustomView: UIView {
    private let cup = CAShapeLayer()
    private let straw = CAShapeLayer()
    private let juice = CAShapeLayer()
    private let shape = CAShapeLayer()
    
    private var cupBezierPath = UIBezierPath()
    private var strawBezierPath = UIBezierPath()
    private var juiceBezierPath = UIBezierPath()
    private var shapeBezierPath = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        isUserInteractionEnabled = true
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(actionss))
        addGestureRecognizer(touchGesture)
        configureCup()
        configureStraw()
        configureJuice()
        configureMask()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureCup() {
        cupBezierPath.move(to: CGPoint(x: 70, y: 250))
        cupBezierPath.addLine(to: CGPoint(x: 100, y: 650))
        cupBezierPath.addCurve(to: CGPoint(x: 300, y: 650),
                               controlPoint1: CGPoint(x: 110, y: 700),
                               controlPoint2: CGPoint(x: 290, y: 700))
        cupBezierPath.addLine(to: CGPoint(x: 330, y: 250))
        cup.strokeColor = UIColor.lightGray.cgColor
        cup.lineWidth = 10
        cup.fillColor = UIColor.systemBackground.cgColor
        cup.path = cupBezierPath.cgPath
        layer.addSublayer(cup)
    }
    
    func configureStraw() {
        straw.position = CGPoint(x: 300, y: 250)
        strawBezierPath.move(to: CGPoint(x: -130, y: 380))
        strawBezierPath.addLine(to: CGPoint(x: 0, y: 0))
        strawBezierPath.move(to: CGPoint(x: 0, y: 0)) // rotate point
        strawBezierPath.addLine(to: CGPoint(x: 80, y: -70))
        straw.strokeColor = UIColor.black.cgColor
        straw.fillColor = UIColor.systemBackground.cgColor
        straw.lineWidth = 20
        straw.lineCap = .round
        straw.path = strawBezierPath.cgPath
        layer.addSublayer(straw)
    }
    
    func configureJuice() {
        juiceBezierPath.move(to: CGPoint(x: 75, y: 250))
        juiceBezierPath.addLine(to: CGPoint(x: 105, y: 650))
        juiceBezierPath.addCurve(to: CGPoint(x: 295, y: 650),
                                 controlPoint1: CGPoint(x: 115, y: 700),
                                 controlPoint2: CGPoint(x: 285, y: 700))
        juiceBezierPath.addLine(to: CGPoint(x: 325, y: 250))
        juice.fillColor = UIColor.orange.cgColor
        juice.path = juiceBezierPath.cgPath
        layer.addSublayer(juice)
    }
    
    func configureMask() {
        shapeBezierPath.move(to: CGPoint(x: 75, y: 250))
        shapeBezierPath.addLine(to: CGPoint(x: 75, y: 700))
        shapeBezierPath.addLine(to: CGPoint(x: 325, y: 700))
        shapeBezierPath.addLine(to: CGPoint(x: 325, y: 250))
        shape.fillColor = UIColor.blue.cgColor
        shape.path = shapeBezierPath.cgPath
        juice.mask = shape
    }
    
    @objc func actionss() {
        let drinkJuice = CABasicAnimation(keyPath: "position.y")
        drinkJuice.fromValue = 0
        drinkJuice.toValue = 400
        drinkJuice.duration = 1.5
        drinkJuice.autoreverses = true
      
        let rotateStraw = CABasicAnimation(keyPath: "transform.rotation.z")
        rotateStraw.fromValue = 0
        rotateStraw.toValue = -Double.pi / 20
        rotateStraw.duration = 1.5
        rotateStraw.autoreverses = true
        shape.add(drinkJuice, forKey: "positionY_Action")
        straw.add(rotateStraw, forKey: "rotationAnimation")
    }
}
