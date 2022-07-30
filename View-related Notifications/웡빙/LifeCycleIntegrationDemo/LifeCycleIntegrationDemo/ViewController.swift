//
//  ViewController.swift
//  LifeCycleIntegrationDemo
//
//  Created by 이원빈 on 2022/07/30.
//

import UIKit

class ViewController: UIViewController {
    // loadView 를 override 를 했는데 그 안에 뷰 지정을 해주지 않으면, 그냥 까만 화면이 나온다 ..!
    // 스토리 보드에 구성해준 화면을 띄워주려면 override loadView 를 쓰면 안된다..!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("First - ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("First - ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("First - ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("First - ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("First - ViewDidDisappear")
    }
}

