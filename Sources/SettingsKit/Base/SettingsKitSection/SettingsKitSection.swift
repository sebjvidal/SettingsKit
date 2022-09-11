//
//  SettingsKitSection.swift
//  SettingsKit
//
//  Created by Seb Vidal on 03/09/2022.
//

import Foundation

public struct SettingsKitSection {
    let settings: [any SettingsKitSetting]
    let header: String?
    let footer: String?
    
    public init(settings: [any SettingsKitSetting], header: String? = nil, footer: String? = nil) {
        self.settings = settings
        self.header = header
        self.footer = footer
    }
}
