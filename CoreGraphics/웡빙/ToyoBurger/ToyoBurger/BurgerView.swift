//
//  BurgerView.swift
//  ToyoBurger
//
//  Created by 이원빈 on 2022/08/27.
//

import UIKit

class BurgerView: UIView {

    override func draw(_ rect: CGRect) {
        let minX: CGFloat = bounds.minX
        let minY: CGFloat = bounds.minY
        let maxX: CGFloat = bounds.maxX
        let maxY: CGFloat = bounds.maxY
        let midX: CGFloat = bounds.midX
        let midY: CGFloat = bounds.midY
        let width: CGFloat = bounds.width
        let height: CGFloat = bounds.height
        let inset: CGFloat = 20
        let upperBunHeight: CGFloat = 40 + 15
        let srirachaSourceHeight: CGFloat = 40 + 7 + 15
        let tomatoHeight: CGFloat = 40 + 7 + 25 + 15
        let sangchuHeight: CGFloat = 40 + 7 + 25 + 15 + 15
        let sangchuCurvedLength: CGFloat = 30
        let pattyHeight: CGFloat = 40 + 7 + 25 + 15 + 20 + 15
        let lowerBunHeight: CGFloat = 40 + 7 + 25 + 15 + 20 + 20 + 15
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        //MARK: 위쪽 버거빵
        context.move(to: CGPoint(x: minX + inset, y: minY + upperBunHeight))
        context.addLine(to: CGPoint(x: maxX - inset, y: minY + upperBunHeight))
        context.setStrokeColor(UIColor.brown.cgColor)
        context.setLineWidth(7)
        context.strokePath()
        
        context.move(to: CGPoint(x: minX + inset, y: minY + upperBunHeight))
        context.addCurve(to: CGPoint(x: maxX - inset, y: minY + upperBunHeight),
                         control1: CGPoint(x: minX , y: 0),
                         control2: CGPoint(x: maxX , y: 0))
        context.setStrokeColor(UIColor.brown.cgColor)
        context.setLineWidth(7)
        context.strokePath()
        
        //MARK: 스리라차 소스
        for i in 0...17 {
            context.move(to: CGPoint(x: minX + 10 + CGFloat(i * 10), y: minY + srirachaSourceHeight))
            context.addLine(to: CGPoint(x: minX + 25 + CGFloat(i * 10), y: minY + srirachaSourceHeight + 15))
            context.setStrokeColor(UIColor.orange.cgColor)
            context.setLineWidth(4)
            context.strokePath()
        }
        
        //MARK: 토마토 두개
        context.move(to: CGPoint(x: minX + inset, y: minY + tomatoHeight))
        context.addLine(to: CGPoint(x: midX - inset/4, y: minY + tomatoHeight))
        context.move(to: CGPoint(x: midX + inset/4, y: minY + tomatoHeight))
        context.addLine(to: CGPoint(x: maxX - inset, y: minY + tomatoHeight))
        context.setStrokeColor(UIColor.red.cgColor)
        context.setLineWidth(12)
        context.strokePath()
        
        //MARK: 양상추 하나
        context.move(to: CGPoint(x: minX + inset, y: minY + sangchuHeight))
        
        context.addCurve(to: CGPoint(x: minX + inset + sangchuCurvedLength, y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + sangchuCurvedLength/2, y: minY + sangchuHeight - 10))
        
        context.addCurve(to: CGPoint(x: minX + inset + (sangchuCurvedLength * 2), y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + sangchuCurvedLength + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + sangchuCurvedLength + sangchuCurvedLength/2 , y: minY + sangchuHeight - 10))

        context.addCurve(to: CGPoint(x: minX + inset + (sangchuCurvedLength * 3), y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + (sangchuCurvedLength * 2) + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + (sangchuCurvedLength * 2) + sangchuCurvedLength/2 , y: minY + sangchuHeight - 10))
        context.addCurve(to: CGPoint(x: minX + inset + (sangchuCurvedLength * 4), y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + (sangchuCurvedLength * 3) + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + (sangchuCurvedLength * 3) + sangchuCurvedLength/2 , y: minY + sangchuHeight - 10))
        context.addCurve(to: CGPoint(x: minX + inset + (sangchuCurvedLength * 5), y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + (sangchuCurvedLength * 4) + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + (sangchuCurvedLength * 4) + sangchuCurvedLength/2 , y: minY + sangchuHeight - 10))
        context.addCurve(to: CGPoint(x: minX + inset + (sangchuCurvedLength * 5) + 10, y: minY + sangchuHeight),
                         control1: CGPoint(x: minX + inset + (sangchuCurvedLength * 5) + sangchuCurvedLength/2, y: minY + sangchuHeight + 10),
                         control2: CGPoint(x: minX + inset + (sangchuCurvedLength * 5) + sangchuCurvedLength/2 , y: minY + sangchuHeight - 10))
        context.setStrokeColor(UIColor.green.cgColor)
        context.setLineCap(.round)
        context.setLineWidth(10)
        context.strokePath()
        
        //MARK: 패티하나
        context.move(to: CGPoint(x: minX + inset, y: minY + pattyHeight))
        context.addLine(to: CGPoint(x: maxX - inset, y: minY + pattyHeight))
        context.setStrokeColor(UIColor.brown.cgColor)
        context.setLineCap(.round)
        context.setLineWidth(18)
        context.strokePath()
        
        //MARK: 밑에 빵
        context.addRect(CGRect(x: minX + inset, y: minY + lowerBunHeight, width: width - (2 * inset), height: 20))
        context.setStrokeColor(UIColor.brown.cgColor)
        context.setLineWidth(7)
        context.setLineJoin(.round)
        context.strokePath()
    }
}
