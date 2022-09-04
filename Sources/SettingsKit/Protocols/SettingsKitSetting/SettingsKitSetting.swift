//
//  SettingsKitSetting.swift
//  SettingsKit
//
//  Created by Seb Vidal on 03/09/2022.
//

import Foundation

public protocol SettingsKitSetting {
    var title: String { get }
    var children: [SettingsKitSecetion] { get }
    var key: String? { get }
    
    func cellReuseIdentifier() -> String
    func cellHeight() -> CGFloat
}

extension SettingsKitSetting {
    public func cellHeight() -> CGFloat {
        return 49
    }
}
