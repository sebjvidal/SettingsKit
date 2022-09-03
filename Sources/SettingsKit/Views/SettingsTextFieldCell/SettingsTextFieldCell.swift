//
//  SettingsTextFieldCell.swift
//  SettingsKit
//
//  Created by Seb Vidal on 29/08/2022.
//

import UIKit

class SettingsTextFieldCell: UITableViewCell, UITextFieldDelegate, SettingsKitCell {
    private var setting: SettingsKitTextField!
    
    private var label: UILabel!
    private var textView: UITextField!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(with setting: SettingsKitSetting) {
        self.setting = setting as? SettingsKitTextField
        
        setupCell()
        setupTextView()
        setupTextField()
    }
    
    private func setupCell() {
        isUserInteractionEnabled = true
    }
    
    private func setupTextView() {
        label = UILabel()
        label.text = setting.title
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupTextField() {
        textView = UITextField()
        textView.delegate = self
        textView.returnKeyType = .done
        textView.textAlignment = .right
        textView.textColor = .secondaryLabel
        textView.keyboardType = setting.type
        textView.font = .systemFont(ofSize: 17)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        if let key = setting.key {
            textView.text = UserDefaults.standard.string(forKey: key)
        }
        
        contentView.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            textView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 16)
        ])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(textField.text, forKey: setting.key!)
    }
}
