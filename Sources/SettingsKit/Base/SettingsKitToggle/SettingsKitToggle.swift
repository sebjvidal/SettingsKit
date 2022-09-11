//
//  SettingsKitToggle.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitToggle: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]?
    public let value: Value?
    
    public enum Value {
        case bool(_: Bool)
        case userDefaults(key: String)
    }
    
    @available(*, unavailable, renamed: "init(title:value:)")
    public init(title: String, key: String) {
        self.title = title
        self.children = []
        self.value = nil
    }
    
    public init(title: String, value: Value) {
        self.title = title
        self.children = []
        self.value = value
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitToggleCell"
    }
}
