//
//  Bag.swift
//  ProtocolOrientedProgramming
//
//  Created by Derrick kim on 2022/07/02.
//

import Foundation

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func printBag() {
        var string = items[0].name
        for i in items.indices {
            string = items[i].name
            print(string)
        }
    }
}
