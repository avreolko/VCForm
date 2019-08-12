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
		case .title(let text): return TitleBuilder(viewConfiguration: TitleViewConfiguration(text: text), viewHandler: nil)
		case .normalText(let text): return LabelBuilder(viewConfiguration: LabelConfiguration(text: text), viewHandler: nil)
		case .image(let image): return ImageViewBuilder(viewConfiguration: ImageViewConfiguration(image: image, height: 200), viewHandler: nil)
		case .padding: return PaddingBuilder(viewConfiguration: .default, viewHandler: nil)
		case .dynamicHeight: return DynamicHeightViewBuilder(viewConfiguration: .default, viewHandler: nil)
		}
	}
}
