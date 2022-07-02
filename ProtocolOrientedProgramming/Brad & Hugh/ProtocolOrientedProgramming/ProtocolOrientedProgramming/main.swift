//
//  main.swift
//  ProtocolOrientedProgramming
//
//  Created by 허건 on 2022/07/02.
//

import Foundation

typealias WattPerHour = Int
typealias Watt = Int

var macBookPro = Macbook(allowedChargeWatts: 130,
                         storedBatteryLevel: 50)

let macBookProCharger = Charger(maximumWattPerHour: 140)

macBookPro.chargeBattery(charger: macBookProCharger)

var gucciBag = Bag()
gucciBag.put(item: macBookPro)
gucciBag.put(item: macBookProCharger)

print(gucciBag.items)
