//
//  MySignView.swift
//  MySign
//
//  Created by Derrick kim on 2022/08/28.
//

import UIKit

class MySignView: UIView {
    override func draw(_ rect: CGRect) {
        let literalD = UIBezierPath()
        literalD.move(to: CGPoint(x: bounds.minX/2, y: bounds.maxY/2))
        literalD.addLine(to: CGPoint(x: bounds.minX, y: 0))
        
        literalD.addQuadCurve(to: CGPoint(x: bounds.minX/2, y: bounds.maxY/2),
                          controlPoint: CGPoint(x: bounds.minX + 100, y: bounds.maxY/4))
        
        literalD.lineWidth = 10
        literalD.stroke()
        
        let literalE = UIBezierPath()
        literalE.move(to: CGPoint(x: bounds.minX/2 + 70, y: 0))
        literalE.addLine(to: CGPoint(x: bounds.minX/2 + 70, y: bounds.maxY/2))
        literalE.addLine(to: CGPoint(x: bounds.minX/2 + 130, y: bounds.maxY/2))
        literalE.move(to: CGPoint(x: bounds.minX/2 + 70, y: 0))
        literalE.addLine(to: CGPoint(x: bounds.minX/2 + 130, y: 0))
        literalE.move(to: CGPoint(x: bounds.minX/2 + 70, y: bounds.midY/2))
        literalE.addLine(to: CGPoint(x: bounds.minX/2 + 130, y: bounds.midY/2))
        literalE.lineWidth = 10
        literalE.stroke()
        
        let literalR = UIBezierPath()
        literalR.move(to: CGPoint(x: bounds.minX/2 + 150, y: 0))
        literalR.addLine(to: CGPoint(x: bounds.minX/2 + 150, y: bounds.maxY/2))
        
        literalR.addQuadCurve(to: CGPoint(x: bounds.minX/2 + 200, y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.midX - 50, y: bounds.midY/2))
        
        literalR.lineWidth = 10
        literalR.stroke()
        
        let literalR2 = UIBezierPath()
        literalR2.move(to: CGPoint(x: bounds.minX/2 + 220, y: 0))
        literalR2.addLine(to: CGPoint(x: bounds.minX/2 + 220, y: bounds.maxY/2))
        
        literalR2.addQuadCurve(to: CGPoint(x: bounds.minX/2 + 260, y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.midX + 20, y: bounds.midY/2))
        
        literalR2.lineWidth = 10
        literalR2.stroke()
        
        let literalI = UIBezierPath()
        literalI.move(to: CGPoint(x: bounds.minX/2 + 280, y: 0))
        literalI.addLine(to: CGPoint(x: bounds.minX/2 + 280, y: 10))
        
        literalI.move(to: CGPoint(x: bounds.minX/2 + 280, y: 50))
        literalI.addLine(to: CGPoint(x: bounds.minX/2 + 280, y: bounds.maxY/2))
        literalI.lineWidth = 10
        literalI.stroke()
        
        let literalC = UIBezierPath()
        literalC.lineWidth = 10
        literalC.stroke()
        
        let literalK = UIBezierPath()
        literalK.lineWidth = 10
        literalK.stroke()
    }
}

