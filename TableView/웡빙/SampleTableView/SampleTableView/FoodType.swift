//
//  FoodType.swift
//  SampleTableView
//
//  Created by 이원빈 on 2022/06/18.
//

import Foundation

enum FoodType: String, CaseIterable {
    case 양식 = "양식"
    case 중식 = "중식"
    case 한식 = "한식"
    case 일식 = "일식"
}

struct Food {
    let name: String
    var price: Int
}
