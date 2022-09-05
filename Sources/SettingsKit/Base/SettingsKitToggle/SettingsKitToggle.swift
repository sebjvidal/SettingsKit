//
//  SettingsKitToggle.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitToggle: SettingsKitSetting {
    public var title: String
    public var children: [SettingsKitSection]
    public var key: String?
    
    public init(title: String, key: String) {
        self.title = title
        self.children = []
        self.key = key
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitToggleCell"
    }
}
