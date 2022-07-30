//
//  NextVC.swift
//  LifeCycleIntegrationDemo
//
//  Created by 이원빈 on 2022/07/30.
//

import UIKit

class NextVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second - ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second - ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second - ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Second - ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Second - ViewDidDisappear")
    }
    
    @IBAction func closeButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
