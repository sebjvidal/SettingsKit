//
//  SettingsKitStepper.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import Foundation

public struct SettingsKitStepper: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]?
    public let value: Value?
    public let min: Double
    public let max: Double
    
    public enum Value {
        case double(_: Double)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:value:min:max:)")
    public init(title: String, key: String, min: Double, max: Double) {
        self.title = title
        self.children = nil
        self.value = nil
        self.min = min
        self.max = max
    }
    
    public init(title: String, value: Value, min: Double, max: Double) {
        self.title = title
        self.children = nil
        self.value = value
        self.min = min
        self.max = max
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitStepperCell"
    }
}
