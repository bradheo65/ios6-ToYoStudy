//
//  CubView.swift
//  CoreGraphics_Sample_Cub
//
//  Created by Derrick kim on 9/3/22.
//

import UIKit

class CubView: UIView {
    init() {
        super.init(frame: .null)
        configureCubView()
        configureStrawView()
        configureCoffeeView()
        
    }
    
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCubView() {
        let cubLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 70, y: 100))
        path.addLine(to: CGPoint(x: 110, y: 600))
        path.addQuadCurve(to: CGPoint(x: 320, y: 600), controlPoint: CGPoint(x: 200, y: 650))
        path.addLine(to: CGPoint(x: 360, y: 100))
        cubLayer.fillColor = UIColor.white.cgColor
        cubLayer.path = path.cgPath
        cubLayer.lineWidth = 10
        cubLayer.strokeColor = UIColor.gray.cgColor
        self.layer.addSublayer(cubLayer)
    }
    
    func configureStrawView() {
        let strawLayer = CAShapeLayer()
        let strawPath = UIBezierPath()
        strawPath.move(to: CGPoint(x: 130, y: 590))
        strawPath.addLine(to: CGPoint(x: 320, y: 100))
        strawPath.move(to: CGPoint(x: 320, y: 100))
        strawPath.addLine(to: CGPoint(x: 400, y: 80))
        strawPath.stroke()
        strawLayer.fillColor = UIColor.white.cgColor
        strawLayer.lineCap = .round
        strawLayer.path = strawPath.cgPath
        strawLayer.lineWidth = 15
        strawLayer.strokeColor = UIColor.black.cgColor
        self.layer.addSublayer(strawLayer)
    }
    
    func configureCoffeeView() {
        let coffeeViewLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 90, y: 300))
        path.addLine(to: CGPoint(x: 115, y: 597))
        path.addQuadCurve(to: CGPoint(x: 315, y: 597), controlPoint: CGPoint(x: 200, y: 645))
        path.addLine(to: CGPoint(x: 340, y: 300))
        coffeeViewLayer.fillColor = UIColor.brown.cgColor
        coffeeViewLayer.path = path.cgPath
        coffeeViewLayer.lineWidth = 0
        coffeeViewLayer.strokeColor = UIColor.gray.cgColor
        
        coffeeViewLayer.mask = configureCoffeeViewMask()

        self.layer.addSublayer(coffeeViewLayer)
    }
    
    func configureCoffeeViewMask() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 90, y: 500))
        path1.addLine(to: CGPoint(x: 115, y: 597))
        path1.addQuadCurve(to: CGPoint(x: 315, y: 597), controlPoint: CGPoint(x: 200, y: 645))
        path1.addLine(to: CGPoint(x: 340, y: 500))
        
        shapeLayer.lineWidth = 0
        shapeLayer.path = path1.cgPath
        
        return shapeLayer
    }
    
    func configureAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 3
        animation.repeatCount = HUGE
        layer.add(animation, forKey: "scoreAnimation")
    }
}
