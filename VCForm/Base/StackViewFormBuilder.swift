//
//  StackViewFormBuilder.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 28/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public protocol IBuildersProvider: AnyObject {
	func provideBuilder(for element: IFormElement) -> IFormViewBuilder?
}

public class StackViewFormBuilder: IFormBuilder {

	public typealias ContainerView = UIStackView

	public weak var buildersProvider: IBuildersProvider?

	public var elementHeightChangedHandler: ((CGFloat) -> Void)?

	private var elements: [IFormElement] = []

	public init() { }

	@discardableResult
	public func append(_ element: IFormElement) -> Self {
		self.elements.append(element)
		return self
	}

	@discardableResult
	public func build(in stackView: ContainerView,
					  viewHandler: (IFormElement, UIView) -> Void) -> Self {

		guard let delegate = self.buildersProvider else {
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
