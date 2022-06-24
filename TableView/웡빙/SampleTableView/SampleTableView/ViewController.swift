//
//  ViewController.swift
//  SampleTableView
//
//  Created by Derrick kim on 2022/06/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var menu: [FoodType: [Food]] = [
        .양식: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 3000)
        ], .중식: [
            Food(name: "탕수육", price: 18000)
        ],
        .한식: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .일식: [
            Food(name: "스시", price: 20000),
            Food(name: "돈까스", price: 5000)
        ]
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foodType = FoodType.allCases
        return menu[foodType[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let foodType = FoodType.allCases
        cell.label.text = menu[foodType[indexPath.section]]?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FoodType.allCases[section].rawValue
    }
}

