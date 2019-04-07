//
//  UIScrollableStackView.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCFormBuilder
import VCExtensions

public struct VCStackFormConfiguration {

	let showScrollIndicator: Bool
	let isScrollEnabled: Bool
	let contentInsets: UIEdgeInsets

	let alignment: UIStackView.Alignment
	let distribution: UIStackView.Distribution

	public static var `default` =
		VCStackFormConfiguration(showScrollIndicator: true, isScrollEnabled: true)

	public init(showScrollIndicator: Bool = true,
				isScrollEnabled: Bool = true,
				contentInsets: UIEdgeInsets = .zero,
				alignment: UIStackView.Alignment = .fill,
				distribution: UIStackView.Distribution = .fill) {

		self.showScrollIndicator = showScrollIndicator
		self.isScrollEnabled = isScrollEnabled
		self.contentInsets = contentInsets
		self.alignment = alignment
		self.distribution = distribution
	}
}

public class VCStackForm: UIView {

	private var scrollView = UIScrollView(frame: .zero)
	private var stackView = UIStackView(frame: .zero)
	private var formBuilder = StackViewFormBuilder()

	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.setup()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
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

	public func configure(with config: VCStackFormConfiguration) {
		self.scrollView.showsVerticalScrollIndicator = config.showScrollIndicator
		self.scrollView.isScrollEnabled = config.isScrollEnabled

		self.stackView.alignment = config.alignment
		self.stackView.distribution = config.distribution

		if #available(iOS 11.0, *) {
			self.stackView.directionalLayoutMargins =
				NSDirectionalEdgeInsets(top: config.contentInsets.top,
										leading: config.contentInsets.left,
										bottom: config.contentInsets.bottom,
										trailing: config.contentInsets.right)

			self.stackView.isLayoutMarginsRelativeArrangement = true
		} else {
			self.stackView.layoutMargins = config.contentInsets
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

	func setup() {
		self.setupStackView()
		self.placeSubviews()

		self.configure(with: VCStackFormConfiguration.default)
		self.setupConstraints()
	}

	func placeSubviews() {
		self.addSubview(self.scrollView)
		self.scrollView.addSubview(stackView)
	}

	func setupConstraints() {
		self.scrollView.setConstraint(edges: .zero, to: self)
		self.stackView.setConstraint(edges: .zero, to: self.scrollView)

		self.stackView
			.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
			.isActive = true
	}

	func setupStackView() {
		self.stackView.axis = .vertical
	}

	func updateContentSize() {
		var contentSize = self.stackView.systemLayoutSizeFitting(UILayoutFittingExpandedSize)
		contentSize.width = self.scrollView.frame.width
		self.scrollView.contentSize = contentSize
	}
}
