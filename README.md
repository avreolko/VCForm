# VCForm
Easy and declarative way to build your scrollable vertical form.

## Features
✅ Declarative filling
```swift
form.add(Builder<UILabel> { $0.text = "Omae wa mou shindeiru" })
	.add(YourViewBuilder()) // inherited from IViewBuilder
	.add(Builder<UIButton>, to: .bottom) // button 'snapped' to the bottom
	.build()
```
✅ Automatic scroll height calculation. Even if you change subview height in a runtime.
✅ Reorderable
```swift
form.configuration = VCFormConfiguration(reorderable: true)
```
✅ Header and footer sections

## How to get started
View builders from the box: `Builder<T: UIView>`, `XibBuilder<T: UIView>`.
First one initilizes view with `.init(frame: .zero)`, the second one loads view from the .xib file.
You also can create your own builders with protocol `IViewBuilder`.

## Installation
For now VCForm supports installation through SPM 📦
