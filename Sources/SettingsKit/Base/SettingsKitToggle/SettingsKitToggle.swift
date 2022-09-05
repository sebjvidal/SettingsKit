//
//  SettingsKitToggle.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitToggle: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]
    public let key: String?
    
    public init(title: String, key: String) {
        self.title = title
        self.children = []
        self.key = key
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitToggleCell"
    }
}
