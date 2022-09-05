//
//  SettingsKitStepperCell.swift
//  
//
//  Created by Seb Vidal on 05/09/2022.
//

import UIKit

class SettingsKitStepperCell: UITableViewCell, SettingsKitCell {
    private var setting: SettingsKitStepper!
    
    private var titleLabel: UILabel!
    private var detailLabel: UILabel!
    private var stepperView: UIStepper!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: SettingsKitSetting, parent: SettingsKitTableViewController) {
        self.setting = setting as? SettingsKitStepper
        
        setupCell()
        setupTitleLabel()
        setupStepperView()
        setupDetailLabel()
    }
    
    private func setupCell() {
        isUserInteractionEnabled = true
        separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = setting.title
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupStepperView() {
        stepperView = UIStepper()
        stepperView.minimumValue = setting.min
        stepperView.maximumValue = setting.max
        stepperView.translatesAutoresizingMaskIntoConstraints = false
        stepperView.value = UserDefaults.standard.double(forKey: setting.key!)
        stepperView.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        contentView.addSubview(stepperView)
        
        NSLayoutConstraint.activate([
            stepperView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stepperView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
        ])
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        UserDefaults.standard.set(sender.value, forKey: setting.key!)
        detailLabel.text = String(Int(sender.value))
    }
    
    private func setupDetailLabel() {
        detailLabel = UILabel()
        detailLabel.textColor = .secondaryLabel
        detailLabel.font = .systemFont(ofSize: 17)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text = String(Int(UserDefaults.standard.double(forKey: setting.key!)))
        
        addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            detailLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: stepperView.leadingAnchor, constant: -16),
        ])
    }
}
