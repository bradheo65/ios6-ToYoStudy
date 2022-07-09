//
//  main.swift
//  ProtocolOrientedProgramming
//
//  Created by Derrick kim on 2022/07/02.
//

import Foundation

let apple: Chargeable = Charger(name: "apple", maximumWattPerHour: 5)
let iphone = Charger(name: "iphone", maximumWattPerHour: 18)
let iPad = Charger(name: "iPad", maximumWattPerHour: 30)
let macBookAir = Charger(name: "macBookAir", maximumWattPerHour: 96)
let macBookPro = Charger(name: "macBookPro", maximumWattPerHour: 106)

var mackBook = Macbook(name: "macbook", allowedChargeWattPerHour: 30, currentBatterryAmount: 20, maxBattertyAmount: 100)

mackBook.chargeBattery(charger: apple)
mackBook.chargeBattery(charger: macBookPro)

//var gucciBag = Bag()
//
//gucciBag.put(item: apple)
//gucciBag.put(item: mackBook)
//gucciBag.put(item: iphone)
//gucciBag.put(item: macBookPro)
//gucciBag.put(item: macBookAir)
//
//gucciBag.printBag()
