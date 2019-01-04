//
//  UIScrollableStackView.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCFormBuilder
import VCExtensions

public class VCStackForm: UIView {

	private var scrollView = UIScrollView(frame: .zero)
	public var stackView = UIStackView(frame: .zero)
	private var formBuilder = StackViewFormBuilder()

	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.configure()
		self.createSubviews()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.configure()
		self.createSubviews()
	}

	public func fill(with models: [FormElementModel]) {
		self.formBuilder.reset()

		models.forEach { (model) in
			self.formBuilder.append(model)
		}

		self.formBuilder.build(in: self.stackView)

		DispatchQueue.main.async {
			self.updateContentSize()
		}
	}
}

extension VCStackForm: IBuildersRegistrar {

	public func builder(for type: IBuilderType) -> IFormViewBuilder? {
		return self.formBuilder.builder(for: type)
	}

	public func register(_ builder: IFormViewBuilder, for type: IBuilderType) {
		self.formBuilder.register(builder, for: type)
	}
}

private extension VCStackForm {

	func createSubviews() {
		let contentView = UIView(frame: .zero)
		self.addSubview(scrollView)
		scrollView.addSubview(contentView)

		scrollView.setConstraint(edges: .zero, to: self)
		contentView.setConstraint(edges: .zero, to: scrollView)
		contentView.setConstraint(centerX: 0, to: scrollView)
		contentView.setConstraint(centerY: 0, to: scrollView)

		contentView.addSubview(stackView)
		stackView.setConstraint(leading: 0, to: contentView)
		stackView.setConstraint(trailing: 0, to: contentView)
		stackView.setConstraint(top: 0, to: contentView)
		stackView.setConstraint(height: 200, priority: .defaultHigh)
	}

	func configure() {
		self.stackView.axis = .vertical
		self.stackView.alignment = .fill
		self.stackView.distribution = .fill
	}

	func updateContentSize() {
		var contentSize = self.stackView.systemLayoutSizeFitting(UILayoutFittingExpandedSize)
		contentSize.width = self.scrollView.frame.width
		self.scrollView.contentSize = contentSize
	}
}
