//
//  MacBook.swift
//  ProtocolOrientedProgramming
//
//  Created by 허건 on 2022/07/02.
//

struct Macbook: Portable {
    let allowedChargeWatts: Watt
    let storedBatteryLevel: Watt
    let maxiumBatteryLevel: Watt

    init(allowedChargeWatts: Watt, storedBatteryLevel: Watt, maxiumBatteryLevel: Watt = 100) {
        self.allowedChargeWatts = allowedChargeWatts
        self.storedBatteryLevel = storedBatteryLevel
        self.maxiumBatteryLevel = maxiumBatteryLevel
    }
    
    mutating func chargeBattery(charger: Chargeable) {
        if storedBatteryLevel == maxiumBatteryLevel {
            print("충전이 완료되었습니다.")
            return
        }
        let watt = charger.convert(chargeableWattPerHour: allowedChargeWatts)
        let hour = (maxiumBatteryLevel - storedBatteryLevel) / watt
        print(hour)
    }
}
