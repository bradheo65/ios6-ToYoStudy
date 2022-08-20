//
//  ViewController.swift
//  Animation2
//
//  Created by dhoney96 on 2022/08/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yagomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animateVibration(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 0.05, delay: 0, options: .repeat) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.yagomImageView.frame = self.yagomImageView.frame.offsetBy(dx: -2, dy: 0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.yagomImageView.frame = self.yagomImageView.frame.offsetBy(dx: 2, dy: 0)
            }
        } completion: { isFinished in
            
        }

    }
    
    @IBAction func animateBounds(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .repeat) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.yagomImageView.bounds.size.height += 150
                self.yagomImageView.bounds.size.width -= 150
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.yagomImageView.bounds.size.height -= 150
                self.yagomImageView.bounds.size.width += 150
            }
        } completion: { isFinished in
            
        }
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        yagomImageView.layer.removeAllAnimations()
    }
    
}

