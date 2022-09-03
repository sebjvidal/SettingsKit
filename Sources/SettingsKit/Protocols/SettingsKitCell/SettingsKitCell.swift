//
//  SettingsKitCell.swift
//  
//
//  Created by Seb Vidal on 03/09/2022.
//

import UIKit

public protocol SettingsKitCell: UITableViewCell {
    func setupCell(with setting: SettingsKitSetting)
}
