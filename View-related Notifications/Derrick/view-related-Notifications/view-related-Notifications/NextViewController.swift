//
//  NextViewController.swift
//  view-related-Notifications
//
//  Created by Derrick kim on 2022/07/30.
//

import UIKit

class NextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("💻 NextViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("💻 NextViewController - viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("💻 NextViewController - viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("💻 NextViewController - viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("💻 NextViewController - viewDidDisappear")
    }
    
    @IBAction func didTappedBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
