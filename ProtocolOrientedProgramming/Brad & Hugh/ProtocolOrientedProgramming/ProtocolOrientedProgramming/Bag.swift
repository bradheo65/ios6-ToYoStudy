//
//  Bag.swift
//  ProtocolOrientedProgramming
//
//  Created by 허건 on 2022/07/02.
//

struct Bag {
    var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
}

