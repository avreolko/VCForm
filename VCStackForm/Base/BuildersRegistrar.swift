//
//  BuildersRegistrar.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

public protocol IBuildersRegistrar {
	func register(_ builder: IFormViewBuilder, for id: String)
}

public class BuildersRegistrar: IBuildersRegistrar {

	private var customBuilders: [String: IFormViewBuilder] = [:]

	public init() { }

	public func builder(for typeID: String) -> IFormViewBuilder? {
		return defaultBuilder(for: typeID) ?? customBuilder(for: typeID)
	}

	public func register(_ builder: IFormViewBuilder, for id: String) {
		self.customBuilders[id] = builder
	}
}

private extension BuildersRegistrar {

	func defaultBuilder(for typeID: String) -> IFormViewBuilder? {
		switch typeID {
		case FormElementType.normalText.rawValue: return LabelBuilder()
		case FormElementType.image.rawValue: return ImageViewBuilder()
		case FormElementType.button.rawValue: return ButtonBuilder()
		case FormElementType.field.rawValue: return TextFieldBuilder()
		case FormElementType.padding.rawValue: return PaddingBuilder()
		default: return nil
		}
	}

	func customBuilder(for typeID: String) -> IFormViewBuilder? {
		guard let builder = self.customBuilders[typeID] else {
			assertionFailure("There is no such builder with this ID.")
			return nil
		}

		return builder
	}
}
