//
//  DefaultFormBuilderDelegate.swift
//  VCFormExample
//
//  Created by Valentin Cherepyanko on 11/08/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCForm

final class BuildersProvider: IBuildersProvider {
	func provideBuilder(for type: IFormElement) -> IFormViewBuilder? {
		guard let defaultType = type as? DefaultFormElement else {
			return nil
		}

		switch defaultType {
		case .title(let text): return TitleBuilder(viewConfiguration: TitleViewConfiguration(text: text))
		case .normalText(let text): return LabelBuilder(viewConfiguration: LabelConfiguration(text: text))
		case .image(let image): return ImageViewBuilder(viewConfiguration: ImageViewConfiguration(image: image, height: 200), viewHandler: nil)
		case .padding: return PaddingBuilder()
		case .dynamicHeight: return DynamicHeightViewBuilder()
		}
	}
}
