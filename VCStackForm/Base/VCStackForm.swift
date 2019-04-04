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
	private var stackView = UIStackView(frame: .zero)
	private var formBuilder = StackViewFormBuilder()

	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.configure()
		self.placeSubviews()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.configure()
		self.placeSubviews()
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

	func placeSubviews() {
		self.addSubview(self.scrollView)
		self.scrollView.setConstraint(edges: .zero, to: self)
		self.scrollView.addSubview(stackView)
		self.stackView.setConstraint(edges: .zero, to: self.scrollView)

		self.stackView
			.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
			.isActive = true
	}

	func configure() {
		self.stackView.axis = .vertical
		self.stackView.alignment = .fill
		self.stackView.distribution = .fillProportionally
	}

	func updateContentSize() {
		var contentSize = self.stackView.systemLayoutSizeFitting(UILayoutFittingExpandedSize)
		contentSize.width = self.scrollView.frame.width
		self.scrollView.contentSize = contentSize
	}
}
