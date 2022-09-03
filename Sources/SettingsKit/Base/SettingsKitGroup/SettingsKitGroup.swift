//
//  SettingsKitGroup.swift
//  SettingsKit
//
//  Created by Seb Vidal on 02/09/2022.
//

import UIKit

public struct SettingsKitGroup: SettingsKitSetting {
    public var icon: Icon?
    public var title: String
    public var children: [SettingsKitSecetion]
    public var key: String?
    
    public init(icon: Icon? = nil, title: String, children: [SettingsKitSecetion] = []) {
        self.icon = icon
        self.title = title
        self.children = children
        self.key = nil
    }
    
    public func cellReuseIdentifier() -> String {
        return "SettingsKitGroupCell"
    }
}

public extension SettingsKitGroup {
    struct Icon {
        var symbol: UIImage?
        var config: UIImage.SymbolConfiguration
        var colour: UIColor
        
        public init(symbol: UIImage? = nil, config: UIImage.SymbolConfiguration = .init(pointSize: 21), colour: UIColor) {
            self.symbol = symbol
            self.config = config
            self.colour = colour
        }
        
        lazy var view: UIView = {
            let iconView = UIView()
            iconView.clipsToBounds = true
            iconView.layer.cornerRadius = 6.5
            iconView.backgroundColor = colour
            iconView.layer.cornerCurve = .continuous
            iconView.translatesAutoresizingMaskIntoConstraints = false
            
            let iconImageView = UIImageView()
            iconImageView.tintColor = .white
            iconImageView.image = symbol?.withConfiguration(config)
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
            
            iconView.addSubview(iconImageView)
            
            NSLayoutConstraint.activate([
                iconView.widthAnchor.constraint(equalToConstant: 29),
                iconView.heightAnchor.constraint(equalToConstant: 29),
                
                iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
                iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor)
            ])
            
            return iconView
        }()
    }
}
