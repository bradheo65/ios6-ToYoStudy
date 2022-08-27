//
//  SignView.swift
//  ToyoSign
//
//  Created by 이원빈 on 2022/08/27.
//

import UIKit

class SignView: UIView {

    override func draw(_ rect: CGRect) {
        let sign = UIBezierPath()
        sign.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX/2 , y: bounds.minY),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX/2, y: bounds.midY))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX/2 , y: bounds.minY + CGFloat(bounds.height * 0.8)),
                                      controlPoint: CGPoint(x: bounds.minX, y: bounds.midY))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX + 30, y: bounds.minY + CGFloat(bounds.height * 0.5)),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX, y: bounds.minY + CGFloat(bounds.height * 0.8)))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX - 30, y: bounds.minY + CGFloat(bounds.height * 0.8)),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX - 30, y: bounds.minY + CGFloat(bounds.height * 0.65) - 30))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX + 100, y: bounds.minY + CGFloat(bounds.height * 0.5)),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX + 65, y: bounds.minY + CGFloat(bounds.height * 0.65) + 50))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX + 30, y: bounds.minY + CGFloat(bounds.height * 0.8)),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX + 30, y: bounds.minY + CGFloat(bounds.height * 0.65) - 30))
        sign.addQuadCurve(to: CGPoint(x: bounds.minX + bounds.midX + 140, y: bounds.minY + CGFloat(bounds.height * 0.5)),
                          controlPoint: CGPoint(x: bounds.minX + bounds.midX + 140, y: bounds.minY + CGFloat(bounds.height * 0.65) + 50))
        sign.lineWidth = 10
        sign.stroke()
    }
}
