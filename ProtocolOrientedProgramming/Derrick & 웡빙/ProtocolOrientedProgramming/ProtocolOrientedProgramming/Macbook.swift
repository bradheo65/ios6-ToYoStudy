//
//  Macbook.swift
//  ProtocolOrientedProgramming
//
//  Created by 이원빈 on 2022/07/02.
//

import Foundation

struct Macbook: Portable {
    var name: String
    
    var allowedChargeWattPerHour: WattPerHour
    var currentBatterryAmount: Watt
    var maxBattertyAmount: Watt
    mutating func chargeBattery(charger: Chargeable) {
        let convertedWattPerHour = charger.convert(
            chargeableWattPerHour: allowedChargeWattPerHour)
        let time = (maxBattertyAmount - currentBatterryAmount) / convertedWattPerHour
        print(time)
    }
}
