# VCForm
[![Tests](https://github.com/avreolko/VCForm/workflows/Tests/badge.svg?branch=master)](https://github.com/avreolko/VCForm/actions/workflows/tests.yml)

An easy declarative way to build your scrollable vertical forms

## Features
✅ Declarative filling
```swift
form.add(Builder<UILabel> { $0.text = "Omae wa mou shindeiru" })
	.add(YourViewBuilder()) // inherited from IViewBuilder
	.add(Builder<UIButton>, to: .bottom) // button 'snapped' to the bottom
	.build()
```
✅ Automatic scroll height calculation that supports changes at runtime

✅ Reorderable forms
```swift
form.configuration = VCFormConfiguration(reorderable: true)
```
✅ Separate header and footer sections

## Demo
Here's an example from my pet project

![form_demo](https://user-images.githubusercontent.com/5366222/77226722-07a52880-6bad-11ea-9967-f9f24bc8d760.gif)

## Installation
Install with SPM 📦

## Usage
You can start building forms straight away with the included builders: `Builder<T: UIView>`, `XibBuilder<T: UIView>`.
The first builder initializes the view with `.init(frame: .zero)`, the second one loads the view from the .xib file.
You also can create your own builders with the `IViewBuilder` protocol.

## License
This project is released under the [MIT license](https://en.wikipedia.org/wiki/MIT_License).
