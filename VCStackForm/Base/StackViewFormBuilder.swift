//
//  ViewFactory.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 28/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

public protocol IStackViewFormBuilderDelegate: AnyObject {
	func provideBuilder(for: IFormElementType) -> IFormViewBuilder?
}

public class StackViewFormBuilder: IFormBuilder {

	public typealias ContainerView = UIStackView

	public weak var delegate: IStackViewFormBuilderDelegate?

	public var elementHeightChangedHandler: ((CGFloat) -> Void)?

	private var elements: [IFormElementType] = []

	public init() { }

	@discardableResult
	public func append(_ element: IFormElementType) -> Self {
		self.elements.append(element)
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

		self.elements.forEach { element in

			guard let builder = delegate.provideBuilder(for: element) else { return }

			let view = builder.build()
			stackView.addArrangedSubview(view)
			viewHandler(element, view)
			view.sizeToFit()
		}

		return self
	}

	@discardableResult
	public func reset() -> Self {
		self.elements.removeAll()
		return self
	}
}
