//
//  BlueView.swift
//  Sample_Responder_Chain
//
//  Created by Derrick kim on 2022/07/04.
//

import UIKit

class BlueView: UIView {
    let name: String = "BlueView"
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    return hitTestView
                }
            }
//            print(self.superview)
            return self
        }
        print("Blue END")
        return nil
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            self.backgroundColor = .white
        }
    }
}
