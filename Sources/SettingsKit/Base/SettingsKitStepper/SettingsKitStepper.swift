//
//  SettingsKitStepper.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import Foundation

public struct SettingsKitStepper: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]
    public let key: String?
    public let min: Double
    public let max: Double
    
    public init(title: String, key: String, min: Double, max: Double) {
        self.title = title
        self.children = []
        self.key = key
        self.min = min
        self.max = max
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitStepperCell"
    }
}
