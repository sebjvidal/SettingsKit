//
//  SettingsKitGroupCell.swift
//  SettingsKit
//
//  Created by Seb Vidal on 29/08/2022.
//

import UIKit

class SettingsKitGroupCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitGroup!
    
    private var iconView = UIView()
    private var textView = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: SettingsKitSetting) {
        self.setting = setting as? SettingsKitGroup
        
        setupCell()
        setupIconView()
        setupTextView()
    }
    
    private func setupCell() {
        separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
        accessoryType = setting.children.isEmpty ? .none : .disclosureIndicator
    }
    
    private func setupIconView() {
        if let view = setting.icon?.view {
            iconView = view
            
            addSubview(iconView)
            
            NSLayoutConstraint.activate([
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            ])
        }
        
    }
    
    private func setupTextView() {
        textView.text = setting.title
        textView.font = .systemFont(ofSize: 17)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(textView)
        
        var iconViewLeadingAnchor: NSLayoutXAxisAnchor {
            if setting.icon != nil {
                return iconView.trailingAnchor
            } else {
                return leadingAnchor
            }
        }
        
        NSLayoutConstraint.activate([
            textView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 14)
        ])
    }
}
