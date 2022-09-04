//
//  SettingsKitSection.swift
//  SettingsKit
//
//  Created by Seb Vidal on 03/09/2022.
//

import Foundation

public struct SettingsKitSecetion {
    var settings: [SettingsKitSetting]
    var header: String?
    var footer: String?
    
    public init(settings: [SettingsKitSetting], header: String? = nil, footer: String? = nil) {
        self.settings = settings
        self.header = header
        self.footer = footer
    }
}
