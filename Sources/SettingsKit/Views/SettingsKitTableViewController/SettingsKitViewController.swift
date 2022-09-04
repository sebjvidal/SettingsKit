//
//  SettingsKitViewController.swift
//  SettingsKit
//
//  Created by Seb Vidal on 04/09/2022.
//

import UIKit

public class SettingsKitViewController: UISplitViewController, UISplitViewControllerDelegate, SettingsKitTableViewControllerDelegate {
    override public var navigationItem: UINavigationItem {
        return settingsViewController.navigationItem
    }
    
    override public var navigationController: UINavigationController? {
        return mainViewController
    }
    
    override public var title: String? {
        get {
            return settingsViewController.title
        } set {
            settingsViewController.title = newValue
        }
    }
    
    private var sections: [SettingsKitSecetion]
    private var settingsViewController: SettingsKitTableViewController!
    private var mainViewController: UINavigationController!
    
    public init(sections: [SettingsKitSecetion]) {
        self.sections = sections
        super.init(style: .doubleColumn)
        setupSplitViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSplitViewController() {
        settingsViewController = SettingsKitTableViewController(sections: sections)
        settingsViewController.delegate = self
        
        mainViewController = UINavigationController(rootViewController: settingsViewController)
        
        setViewController(mainViewController, for: .primary)
//        preferredDisplayMode = .twoBesideSecondary
//        preferredSplitBehavior = .tile
        delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
    
    func showDetailViewController(_ viewController: UIViewController) {
        setViewController(nil, for: .secondary)
        setViewController(viewController, for: .secondary)
    }
}
