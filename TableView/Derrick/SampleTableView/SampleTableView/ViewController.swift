//
//  ViewController.swift
//  SampleTableView
//
//  Created by Derrick kim on 2022/06/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    // 다음과 같은 배열을 tableView에 출력했을 시 아래와 같은 화면이 표시됩니다.
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "메뉴판"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu[.American]!.count
        case 1:
            return menu[.Chinese]!.count
        case 2:
            return menu[.Korean]!.count
        case 3:
            return menu[.Japanese]!.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        switch indexPath.section {
        case 0:
            cell.descriptionLabel.text = menu[.American]?[indexPath.row].name
        case 1:
            cell.descriptionLabel.text = menu[.Chinese]?[indexPath.row].name
        case 2:
            cell.descriptionLabel.text = menu[.Korean]?[indexPath.row].name
        case 3:
            cell.descriptionLabel.text = menu[.Japanese]?[indexPath.row].name
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return FoodType.American.rawValue
        case 1:
            return FoodType.Chinese.rawValue
        case 2:
            return FoodType.Korean.rawValue
        case 3:
            return FoodType.Japanese.rawValue
        default:
            return "ETC"
        }
    }
}
