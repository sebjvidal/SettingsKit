//
//  SettingsKitTextField.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitTextField: SettingsKitSetting {
    public let title: String
    public let children: [SettingsKitSection]
    public let type: UIKeyboardType
    public let key: String?
    
    public init(title: String, key: String) {
        self.title = title
        self.children = []
        self.type = .default
        self.key = key
    }
    
    public init(title: String, type: UIKeyboardType, key: String) {
        self.title = title
        self.children = []
        self.type = type
        self.key = key
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitTextFieldCell"
    }
}
