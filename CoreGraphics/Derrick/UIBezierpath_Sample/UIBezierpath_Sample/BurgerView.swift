//
//  BurgerView.swift
//  UIBezierpath_Sample
//
//  Created by Derrick kim on 2022/08/25.
//

import UIKit

class BurgerView: UIView {
    override func draw(_ rect: CGRect) {
        createpatty()
        
    }
    
    func drawBurger() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // bottomBrad
        context.addRect(CGRect(x: 107, y: 350, width: 200, height: 30))
        context.setStrokeColor(UIColor.systemBrown.cgColor)
        context.setLineWidth(5)
        context.strokePath()
        
        // patty
        context.addRect(CGRect(x: 100, y: 320, width: 220, height: 20))
        context.setFillColor(UIColor.systemBrown.cgColor)
        context.fill(CGRect(x: 100, y: 320, width: 220, height: 20))
        //        context.setLineCap(.round)
        //        context.setLineJoin(.round)
        context.strokePath()
        
        // lettuce
        context.move(to: CGPoint(x: 100, y: 290))
        context.addCurve(to: CGPoint(x: 150, y: 290),
                         control1: CGPoint(x: 115, y: 250),
                         control2: CGPoint(x: 130, y: 320))
        
        context.addCurve(to: CGPoint(x: 200, y: 290),
                         control1: CGPoint(x: 160, y: 250),
                         control2: CGPoint(x: 180, y: 320))
        
        context.addCurve(to: CGPoint(x: 250, y: 290),
                         control1: CGPoint(x: 200, y: 250),
                         control2: CGPoint(x: 230, y: 320))
        
        context.addCurve(to: CGPoint(x: 300, y: 290),
                         control1: CGPoint(x: 260, y: 250),
                         control2: CGPoint(x: 280, y: 320))
        
        context.setStrokeColor(UIColor.systemGreen.cgColor)
        context.strokePath()
        
        // tomato1
        context.addRect(CGRect(x: 220, y: 250, width: 100, height: 20))
        context.fill(CGRect(x: 220, y: 250, width: 100, height: 20))
        context.setFillColor(UIColor.systemRed.cgColor)
        
        context.addRect(CGRect(x: 100, y: 250, width: 100, height: 20))
        context.fill(CGRect(x: 100, y: 250, width: 100, height: 20))
        context.setFillColor(UIColor.systemRed.cgColor)
        context.strokePath()
        
        var minX = 100
        for _ in 0...10 {
            context.move(to: CGPoint(x: minX, y: 220))
            context.addLine(to: CGPoint(x: minX + 20, y: 240))
            context.setStrokeColor(UIColor.systemOrange.cgColor)
            minX += 20
        }
        context.strokePath()
        
        context.move(to: CGPoint(x: 100, y: 200))
        context.addLine(to: CGPoint(x: 330, y: 200))
        //        topBrad.addQuadCurve(to: CGPoint(x: 100, y: 200), controlPoint: CGPoint(x: 200, y: 80))
        context.addArc(center: CGPoint(x: 220, y: 200),
                       radius: 115,
                       startAngle: 0,
                       endAngle: (180 * .pi) / 180 ,
                       clockwise: true)
        context.setStrokeColor(UIColor.systemBrown.cgColor)
        context.strokePath()
    }
    
    func createpatty() {
        let topBrad = UIBezierPath()
        //        topBrad.move(to: CGPoint(x: 100, y: 200))
        //        topBrad.addLine(to: CGPoint(x: 330, y: 200))
        //        topBrad.addQuadCurve(to: CGPoint(x: 100, y: 200), controlPoint: CGPoint(x: 200, y: 80))
        
        topBrad.addArc(withCenter: CGPoint(x: 220, y: 200),
                       radius: 115,
                       startAngle: 0,
                       endAngle: (180 * .pi) / 180 ,
                       clockwise: false)
        
        topBrad.lineWidth = 5
        topBrad.close()
        
        UIColor.systemBrown.set()
        topBrad.stroke()
        
        var minX = 100
        for _ in 0...10 {
            let source = UIBezierPath()
            source.move(to: CGPoint(x: minX, y: 220))
            source.addLine(to: CGPoint(x: minX + 20, y: 240))
            source.lineWidth = 5
            UIColor.systemOrange.set()
            source.stroke()
            minX += 20
        }
        
        let tomato2 = UIBezierPath(rect: CGRect(x: 220, y: 250, width: 100, height: 20))
        UIColor.systemRed.set()
        tomato2.lineWidth = 5
        tomato2.fill()
        tomato2.stroke()
        
        let tomato1 = UIBezierPath(rect: CGRect(x: 100, y: 250, width: 100, height: 20))
        UIColor.systemRed.set()
        tomato1.lineWidth = 5
        tomato1.fill()
        tomato1.stroke()
        
        
        let lettuce = UIBezierPath()
        lettuce.move(to: CGPoint(x: 100, y: 290))
        lettuce.addCurve(to: CGPoint(x: 150, y: 290),
                         controlPoint1: CGPoint(x: 115, y: 250),
                         controlPoint2: CGPoint(x: 130, y: 320))
        
        lettuce.addCurve(to: CGPoint(x: 200, y: 290),
                         controlPoint1: CGPoint(x: 160, y: 250),
                         controlPoint2: CGPoint(x: 180, y: 320))
        
        lettuce.addCurve(to: CGPoint(x: 250, y: 290),
                         controlPoint1: CGPoint(x: 200, y: 250),
                         controlPoint2: CGPoint(x: 230, y: 320))
        
        lettuce.addCurve(to: CGPoint(x: 300, y: 290),
                         controlPoint1: CGPoint(x: 260, y: 250),
                         controlPoint2: CGPoint(x: 280, y: 320))
        
        UIColor.systemGreen.set()
        lettuce.lineWidth = 5
        lettuce.stroke()
        
        let patty = UIBezierPath(roundedRect: CGRect(x: 100, y: 320, width: 220, height: 20), cornerRadius: 10)
        UIColor.systemBrown.set()
        patty.lineWidth = 5
        patty.fill()
        patty.close()
        patty.stroke()
        
        let bottomBrad = UIBezierPath(roundedRect: CGRect(x: 107, y: 350, width: 200, height: 30), cornerRadius: 3)
        
        UIColor.systemBrown.set()
        bottomBrad.lineWidth = 5
        
        bottomBrad.close()
        bottomBrad.stroke()
    }
}
