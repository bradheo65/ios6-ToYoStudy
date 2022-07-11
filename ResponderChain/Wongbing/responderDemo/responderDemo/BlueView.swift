//
//  BlueView.swift
//  responderDemo
//
//  Created by 이원빈 on 2022/07/09.
//

import UIKit

class BlueView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isUserInteractionEnabled || isHidden || alpha <= 0.01 {
            return nil
        }
     
        if self.point(inside: point, with: event) {
            for subview in subviews.reversed() {
                let convertedPoint = subview.convert(point, from: self)
                if let hitTestView = subview.hitTest(convertedPoint, with: event) {
                    print(hitTestView.restorationIdentifier!)
                    return hitTestView
                }
            }
            print(self.restorationIdentifier!)
            return self
        }
        print("isNotBlueView")

        return nil
    }
}
