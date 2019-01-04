# VCStackForm
This is an implementation of abstraction [VCFormBuilder](https://github.com/avreolko/VCFormBuilder). 
It uses `UIStackView` inside.
Library can help you build at ease scrollable form or any other vertical 'stack' view.

## How to get started
There is an example of use in sources.

For view construction library uses builders.
There is some default view builders such as:
- Text field
- Button
- Image
- Normal text
- Padding between other views
- Title

You can add your own builders with protocols `IFormViewBuilder` and `IFormViewConfigurator`.
Then you need to register it on `VCStackForm` instance with this method:
```swift
func register(_ builder: IFormViewBuilder, for type: IBuilderType)
```
Basically, like `UITableView`, but with enum instead of string ID.

## Installation
For now VCStackForm supports installation through `Carthage`. Maybe in future I will add `CocoaPods`.
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate VCStackForm into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "avreolko/VCStackForm" >= 0.2
```

Run `carthage` to build the framework and drag the built `VCStackForm.framework` into your Xcode project.
