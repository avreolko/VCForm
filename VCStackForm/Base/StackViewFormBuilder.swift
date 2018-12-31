//
//  ViewFactory.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 28/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

internal class StackViewFormBuilder: IFormBuilder {

	typealias ContainerView = UIStackView

	private let buildersRegistrar = BuildersRegistrar()
	private var models: [FormElementModel] = []

	@discardableResult
	func append(_ model: FormElementModel) -> Self {
		self.models.append(model)
		return self
	}

	@discardableResult
	func build(in stackView: ContainerView) -> Self {
		
		stackView.subviews.forEach { $0.removeFromSuperview() }

		self.models.forEach { (model) in
			if let builder = self.buildersRegistrar.builder(for: model.type.rawValue) {
				let view = builder.buildView(with: model.data)
				view.sizeToFit()
				stackView.addArrangedSubview(view)
			}
		}

		return self
	}

	@discardableResult
	func reset() -> Self {
		self.models.removeAll()
		return self
	}
}

extension StackViewFormBuilder: IBuildersRegistrar {
	
	func register(_ builder: IFormViewBuilder, for id: String) {
		self.buildersRegistrar.register(builder, for: id)
	}
}
