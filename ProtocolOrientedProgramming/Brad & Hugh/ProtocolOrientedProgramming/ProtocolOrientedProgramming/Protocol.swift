//
//  Protocol.swift
//  ProtocolOrientedProgramming
//
//  Created by 허건 on 2022/07/02.
//

protocol Chargeable {
    var maximumWattPerHour: WattPerHour { get }
    func convert(chargeableWattPerHour: WattPerHour) -> WattPerHour
}

protocol Portable { }
