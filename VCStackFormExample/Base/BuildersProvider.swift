//
//  DefaultFormBuilderDelegate.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 11/08/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm

final class BuildersProvider: IBuildersProvider {
	func provideBuilder(for type: IFormElementType) -> IFormViewBuilder? {
		guard let defaultType = type as? DefaultFormElementType else {
			return nil
		}

		switch defaultType {
		case .normalText(let text): return LabelBuilder(configuration: text, viewHandler: nil)
		case .image(let image, let height): return ImageViewBuilder(configuration: (image, height), viewHandler: nil)
		case .button(let title, let tapHandler): return ButtonBuilder(configuration: (title, tapHandler), viewHandler: nil)
		case .field(let changeHandler): return TextFieldBuilder(configuration: changeHandler, viewHandler: nil)
		case .padding(let value): return PaddingBuilder(configuration: value, viewHandler: nil)
		case .title(let value): return TitleBuilder(configuration: value, viewHandler: nil)
		case .dynamicHeight(let collapsedHeight, let expandedHeight): return DynamicHeightViewBuilder(configuration: (collapsedHeight, expandedHeight), viewHandler: nil)
		}
	}
}
