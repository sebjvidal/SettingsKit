//
//  SettingsKitGroupCell.swift
//  SettingsKit
//
//  Created by Seb Vidal on 29/08/2022.
//

import UIKit

class SettingsKitGroupCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitGroup!
    private weak var parent: SettingsKitTableViewController?
    
    private var iconView = UIView()
    private var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: any SettingsKitSetting, parent: SettingsKitTableViewController) {
        self.setting = setting as? SettingsKitGroup
        self.parent = parent
        
        setupCell()
        setupIconView()
        setupTitleLabel()
    }
    
    private func setupCell() {
        separatorInset = UIEdgeInsets(top: 0, left: setting.icon == nil ? 20 : 64, bottom: 0, right: 0)
        
        guard let children = setting.children else { return }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if let isRoot = parent?.isRoot, !isRoot {
                accessoryType = children.isEmpty ? .none : .disclosureIndicator
            }
        } else {
            accessoryType = children.isEmpty ? .none : .disclosureIndicator
        }
    }
    
    private func setupIconView() {
        if let view = setting.icon?.view {
            iconView = view()
            
            addSubview(iconView)
            
            NSLayoutConstraint.activate([
                iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
                iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            ])
        }
        
    }
    
    private func setupTitleLabel() {
        titleLabel.text = setting.title
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        var iconViewLeadingAnchor: NSLayoutXAxisAnchor {
            return setting.icon != nil ? iconView.trailingAnchor : leadingAnchor
        }
        
        var iconViewLeadingConstant: CGFloat {
            return setting.icon != nil ? 14 : 20
        }
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconViewLeadingAnchor, constant: iconViewLeadingConstant)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if UIDevice.current.userInterfaceIdiom == .pad {
            titleLabel.textColor = selected ? .white : .label
        }
    }
}
