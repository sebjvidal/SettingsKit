<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.2-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-iOS-brightgreen.svg?style=flat" alt="iOS" />
    <a href="https://twitter.com/johnsundell">
        <img src="https://img.shields.io/badge/twitter-@sebjvidal-blue.svg?style=flat" alt="Twitter: @sebjvidal" />
    </a>
</p>

# SettingsKit

A light-weight, extensible package for building iOS settings screens in a pinch.

## Installation
SettingsKit can be installed using Swift Package Manager. To get started...
1. Open your project in Xcode and navigate to `File`, `Add Packages...`
2. Search for `https://github.com/sebjvidal/SettingsKit.git` in the "Search or Enter Package URL" toolbar item
3. Choose `SettingsKit`
4. Click `Add Package`

## Usage
To create a new settings screen, create an array of `SettingsKitSections`. These sections can have an array of `children`, along with an optional `header` and `footer`.
```swift
import SettingsKit

let sections: [SettingsKitSection] = [
    SettingsKitSecetion(
        settings: [
            SettingsKitGroup(
                icon: SettingsKitIcon(
                    symbol: UIImage(systemName: "gear"),
                    config: UIImage.SymbolConfiguration(pointSize: 21),
                    colour: .systemGray
                ),
                title: "General",
                children: [
                    SettingsKitSecetion(
                        settings: [
                            SettingsKitToggle(title: "A Toggle Cell", key: "toggle")
                            SettingsKitTextField(title: "A TextField Cell", key: "textField")
                        ]
                    )
                ]
            )
        ]
    )
]

let viewController = SettingsKitViewController(sections: sections)
```
The `children` property of `SettingsKitSections` takes an array of `SettingsKitSections`, so you can go as many layers deep as you need.

## About
SettingsKit is built with UIKit, so you can customise the `SettingsKitViewController` as you would a `UITableViewController`.
