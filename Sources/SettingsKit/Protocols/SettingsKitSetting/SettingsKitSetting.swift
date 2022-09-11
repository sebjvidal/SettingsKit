//
//  SettingsKitSetting.swift
//  SettingsKit
//
//  Created by Seb Vidal on 03/09/2022.
//

import Foundation

public protocol SettingsKitSetting {
    var title: String { get }
    var children: [SettingsKitSection]? { get }
    var value: Value? { get }
    
    func cellReuseIdentifier() -> String
    func cellHeight() -> CGFloat
    
    associatedtype Value
}

extension SettingsKitSetting {
    public func cellHeight() -> CGFloat {
        return 49
    }
}
