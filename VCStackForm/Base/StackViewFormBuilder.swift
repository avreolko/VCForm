//
//  ViewFactory.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 28/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

public protocol IStackViewFormBuilderDelegate: AnyObject {
	func provideBuilder(for: IFormElementType) -> IFormViewBuilder
}

public class StackViewFormBuilder: IFormBuilder {

	public typealias ContainerView = UIStackView

	public weak var delegate: IStackViewFormBuilderDelegate?

	public var elementHeightChangedHandler: ((CGFloat) -> Void)?

	private var models: [FormElementModel] = []

	public init() { }

	@discardableResult
	public func append(_ model: FormElementModel) -> Self {
		self.models.append(model)
		return self
	}

	@discardableResult
	public func build(in stackView: ContainerView,
					  viewHandler: (IFormElementType, UIView) -> Void) -> Self {

		guard let delegate = self.delegate else {
			assertionFailure("Delegate should be set at this point.")
			return self
		}

		stackView.subviews.forEach { $0.removeFromSuperview() }

		self.models.forEach { (model) in

			let builder = delegate.provideBuilder(for: model.type)

			let view = builder.buildView(with: model.data)

			stackView.addArrangedSubview(view)

			(view as? IDynamicHeight).map { [weak self] in
				$0.heightChangedHandler = self?.elementHeightChangedHandler
			}

			viewHandler(model.type, view)

			view.sizeToFit()
		}

		return self
	}

	@discardableResult
	public func reset() -> Self {
		self.models.removeAll()
		return self
	}
}
