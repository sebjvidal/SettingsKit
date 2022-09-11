//
//  SettingsKitLabel.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import UIKit

public struct SettingsKitLabel: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case string(_: String)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:value:)")
    public init(title: String, key: String) {
        self.title = title
        self.children = nil
        self.value = nil
    }
    
    public init(title: String, value: Value) {
        self.title = title
        self.children = nil
        self.value = value
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitLabelCell"
    }
}
