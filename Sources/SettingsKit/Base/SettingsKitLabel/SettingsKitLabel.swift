//
//  SettingsKitLabel.swift
//  SettingsKit
//
//  Created by Seb Vidal on 05/09/2022.
//

import UIKit

public struct SettingsKitLabel: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]
    public let key: String?
    
    public init(title: String, key: String) {
        self.title = title
        self.children = []
        self.key = key
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitLabelCell"
    }
}
