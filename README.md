# VCForm
Easy and declarative way to build your scrollable vertical form.
It uses `UIStackView` inside.

## How to get started
There is a demo in this repo.
For view construction library uses builders.
All you need is add your own builders with inherited `IViewBuilder` protocol.

## Installation
For now VCForm supports installation through `Carthage`.
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate VCForm into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "avreolko/VCForm" >= 0.2
```

Run `carthage` to build the framework and drag the built `VCForm.framework` into your Xcode project.
