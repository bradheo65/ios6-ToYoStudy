//
//  GreenView.swift
//  Sample_Responder_Chain
//
//  Created by Derrick kim on 2022/07/03.
//

import UIKit

class GreenView: UIView {
    let name: String = "Green"
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
        
        
        
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
//                    print(hitTestView.restorationIdentifier)
                    return hitTestView
                }
            }
//            print(self.superview)
            return self
        }
        
        print("Green END")
        return nil
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if event?.subtype == .motionShake {
            backgroundColorChange()
        }
    }
    
    func backgroundColorChange() {
        if self.backgroundColor == .red {
            self.backgroundColor = .white
        } else {
            self.backgroundColor = .red
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
}
