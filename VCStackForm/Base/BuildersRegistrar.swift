//
//  BuildersRegistrar.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

public class BuildersRegistrar: IBuildersRegistrar {

	private var customBuilders: [String: IFormViewBuilder] = [:]

	public init() { }

	public func builder(for type: IFormElementType) -> IFormViewBuilder? {
		return defaultBuilder(for: type.stringID) ?? customBuilder(for: type.stringID)
	}

	public func register(_ builder: IFormViewBuilder, for type: IFormElementType) {
		self.customBuilders[type.stringID] = builder
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
		case FormElementType.title.rawValue: return TitleBuilder()
		case FormElementType.dynamicHeight.rawValue: return DynamicHeightViewBuilder()
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
