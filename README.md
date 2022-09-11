<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://github.com/sebjvidal/SettingsKit/blob/main/Images/SettingsKit-Dark.png">
        <source media="(prefers-color-scheme: light)" srcset="https://github.com/sebjvidal/SettingsKit/blob/main/Images/SettingsKit-Light.png">
        <img alt="SettingsKit." src="https://github.com/sebjvidal/SettingsKit/blob/main/Images/SettingsKit-Light.png" width="600">
    </picture>
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.7-orange.svg" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/spm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-iOS, iPadOS-brightgreen.svg?style=flat" alt="iOS" />
    <a href="https://twitter.com/johnsundell">
        <img src="https://img.shields.io/badge/twitter-@sebjvidal-blue.svg?style=flat" alt="Twitter: @sebjvidal" />
    </a>
</p>

# SettingsKit

A light-weight, extensible package for easily building pixel-perfect iOS settings screens in a pinch.

## Installation
SettingsKit can be installed using Swift Package Manager. To get started...
1. Open your project in Xcode and navigate to `File`, `Add Packages...`
2. Search for `https://github.com/sebjvidal/SettingsKit.git` in the "Search or Enter Package URL" toolbar item
3. Choose `SettingsKit`
4. Click `Add Package`

## Usage
In the following example, you'll learn how to build a settings screen with a single "General" group that has four child settings.

To begin, create an `Array` with a single `SettingsKitSection` object, parsing an `Array` of `SettingsKitSetting` to its `setting` initialiser.

```swift
import SettingsKit

let generalSections: [SettingsKitSection] = [
    SettingsKitSection(
        settings: [
            SettingsKitLabel(title: "A Label Cell", value: .userDefaults(key: "label")),
            SettingsKitToggle(title: "A Toggle Cell", value: .userDefaults(key: "toggle")),
            SettingsKitTextField(title: "A TextField Cell", value: .userDefaults(key: "textField")),
            SettingsKitStepper(title: "A Stepper Cell", value: .userDefaults(key: "stepper"), min: 0, max: 10)
        ]
    )
]
```
Each object conforming to the `SettingsKitSetting` protocol has a `value` property. This is an Enum case that can be a raw value, for example, `.string("String")`. Alternatively, this can be a UserDefaults key, for examlpe, `.userDefaults(key: "Key")`.

Next, we'll build the `SettingsKitGroup` and, subsequently the `SettingsKitGroup.Icon`. Start by creating the `SettingsKitGroup.Icon` and populating its `symbol`, `config` and `colour` initialisers with a `UIImage`, `UIImage.SymbolConfiguration` and `UIColor`, respectively.

```swift
let generalIcon = SettingsKitGroup.Icon(
    symbol: UIImage(systemName: "gear"),
    config: UIImage.SymbolConfiguration(pointSize: 21),
    colour: UIColor.systemGray
)
```

Now, define a second `Array` of `SettingsKitSection`, passing an `Array` of `SettingsKitSetting` to its `settings` parameter. Populate the `SettingsKitSetting` `Array` with a single `SettingsKitGroup` object. Set the `icon` parameter to the `generalIcon` created above. Set the `title` parameter to `"General"`. And set the `children` parameter to the `generalSections` array.
```swift
let rootSections: [SettingsKitSection] = [
    SettingsKitSection(
        settings: [
            SettingsKitGroup(icon: generalIcon, title: "General", children: generalSections)
        ]
    )
]
```

Finally, create the `SettingsKitViewController`, populating the `sections` parameter with the previously defined `rootSections` `Array`.
```swift
let viewController = SettingsKitViewController(sections: rootSections)
```

Additionally, the root `SettingsKitViewController` navigation elements can be customised as follows.
```swift
viewController.title = "SettingsKit"
viewController.navigationItem.largeTitleDisplayMode = .automatic
viewController.navigationController?.navigationBar.prefersLargeTitles = true
```

This is what your finished product should look like...
<p>
<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/sebjvidal/SettingsKit/blob/main/Images/Demo-Dark.png">
    <source media="(prefers-color-scheme: light)" srcset="https://github.com/sebjvidal/SettingsKit/blob/main/Images/Demo-Light.png">
    <img alt="SettingsKit." src="https://github.com/sebjvidal/SettingsKit/blob/main/Images/Demo-Light.png" width="600">
</picture>
</p>

## About
SettingsKit is built with UIKit, so you can customise the `SettingsKitViewController` as you would a `UITableViewController`.

Be careful when overriding the `SettingsKitViewController` `tableView`'s delegate methods, as the following methods are used internally to make the package functional: 
- `numberOfSections(in:)`
- `tableView(_:titleForHeaderInSection:)`
- `tableView(_:titleForFooterInSection:)`
- `tableView(_:numberOfRowsInSection:)`
- `tableView(_:cellForRowAt:)`
- `tableView(_:heightForRowAt)`
- `tableView(_:shouldHighlightRowAt:)`
- `tableView(_:didSelectRowAt:)`
