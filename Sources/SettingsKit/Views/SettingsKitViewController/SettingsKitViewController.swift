import UIKit

public class SettingsKitViewController: UITableViewController {
    var sections: [SettingsKitSecetion] = []
    
    public init(sections: [SettingsKitSecetion], style: UITableView.Style = .insetGrouped) {
        super.init(style: style)
        tableView.register(SettingsKitGroupCell.self, forCellReuseIdentifier: "SettingsKitGroupCell")
        tableView.register(SettingsKitToggleCell.self, forCellReuseIdentifier: "SettingsKitToggleCell")
        tableView.register(SettingsTextFieldCell.self, forCellReuseIdentifier: "SettingsTextFieldCell")
        self.sections = sections
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }
    
    public override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].settings.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = sections[indexPath.section].settings[indexPath.row]
        let reuseIdentifier = setting.cellReuseIdentifier()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as! SettingsKitCell
        cell.setupCell(with: setting)
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].settings[indexPath.row].cellHeight()
    }
    
    public override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return !sections[indexPath.section].settings[indexPath.row].children.isEmpty
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let setting = sections[indexPath.section].settings[indexPath.row]
        let viewController = SettingsKitViewController(sections: setting.children)
        viewController.navigationItem.title = setting.title
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
