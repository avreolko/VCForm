//
//  ViewFactory.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 28/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCFormBuilder

public class StackViewFormBuilder: IFormBuilder {

	public typealias ContainerView = UIStackView

	private let buildersRegistrar = BuildersRegistrar()

	private var models: [FormElementModel] = []

	public var elementHeightChangedHandler: ((CGFloat) -> Void)?

	public init() { }

	@discardableResult
	public func append(_ model: FormElementModel) -> Self {
		self.models.append(model)
		return self
	}

	@discardableResult
	public func build(in stackView: ContainerView,
					  viewHandler: (IFormElementType, UIView) -> Void) -> Self {
		
		stackView.subviews.forEach { $0.removeFromSuperview() }

		self.models.forEach { (model) in
			if let builder = self.buildersRegistrar.builder(for: model.type) {
				let view = builder.buildView(with: model.data)
				stackView.addArrangedSubview(view)

				(view as? IDynamicHeight).map { [weak self] in
					$0.heightChangedHandler = self?.elementHeightChangedHandler
				}

				viewHandler(model.type, view)

				view.sizeToFit()
			}
		}

		return self
	}

	@discardableResult
	public func reset() -> Self {
		self.models.removeAll()
		return self
	}
}

extension StackViewFormBuilder: IBuildersRegistrar {
	public func builder(for type: IFormElementType) -> IFormViewBuilder? {
		return self.buildersRegistrar.builder(for: type)
	}
	
	public func register(_ builder: IFormViewBuilder, for type: IFormElementType) {
		self.buildersRegistrar.register(builder, for: type)
	}
}
