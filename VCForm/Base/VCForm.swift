//
//  VCForm.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCWeakContainer

public enum FormPosition {
	case top, scroll, bottom
}

public class VCForm: UIView {

	private var config: VCFormConfiguration = .default

	private var topStackView = UIStackView(frame: .zero)
	private var scrollView = UIScrollView(frame: .zero)
	private var scrollStackView = UIStackView(frame: .zero)
	private var bottomStackView = UIStackView(frame: .zero)

	private typealias FormElement = (String, IFormViewBuilder)
	private var topBuilders: [FormElement] = []
	private var scrollBuilders: [FormElement] = []
	private var bottomBuilders: [FormElement] = []

	private var placedElements: [(String, Weak<UIView>)] = []

	private var topConstraint: NSLayoutConstraint?
	private var bottomConstraint: NSLayoutConstraint?

	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.setup()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}
}

public extension VCForm {
	@discardableResult
	func configure(with config: VCFormConfiguration) -> Self {
		self.config = config

		self.scrollView.showsVerticalScrollIndicator = config.showScrollIndicator
		self.scrollView.isScrollEnabled = config.isScrollEnabled

		self.configure(self.topStackView, with: config)
		self.configure(self.scrollStackView, with: config)
		self.configure(self.bottomStackView, with: config)

		self.configureInsets(with: config)

		return self
	}

	@discardableResult
	func add(_ builder: IFormViewBuilder,
			 to position: FormPosition = .scroll,
			 id: String? = nil) -> Self {

		let elementID = id ?? String(describing: IFormViewBuilder.self)
		let element = (elementID, builder)

		switch position {
		case .top: self.topBuilders.append(element)
		case .scroll: self.scrollBuilders.append(element)
		case .bottom: self.bottomBuilders.append(element)
		}

		return self
	}

	@discardableResult
	func build() -> Self {

		self.topBuilders.forEach { (id, builder) in
			self.buildView(with: builder, and: id, in: self.topStackView)
		}

		self.scrollBuilders.forEach { (id, builder) in
			self.buildView(with: builder, and: id, in: self.scrollStackView)
		}

		self.bottomBuilders.forEach { (id, builder) in
			self.buildView(with: builder, and: id, in: self.bottomStackView)
		}

		return self
	}

	@discardableResult
	func reset() -> Self {
		self.placedElements.forEach { $0.1.object?.removeFromSuperview() }
		self.placedElements = []
		return self
	}
}

public extension VCForm {

	func hide(_ elementID: String) {
		self.hide(true, id: elementID)
	}

	func show(_ elementID: String) {
		self.hide(false, id: elementID)
	}

	func hide(_ hide: Bool, id: String) {
		self.placedElements
			.filter { $0.0 == id }
			.forEach { $0.1.object?.isHidden = hide }

		UIView.animate(withDuration: self.config.heightAnimationDuration, animations: {
			self.layoutIfNeeded()
		})
	}
}

// MARK: setup
private extension VCForm {

	func setup() {
		self.topStackView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
		self.scrollStackView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
		self.bottomStackView.backgroundColor = UIColor.blue.withAlphaComponent(0.5)

		self.setupStackView()
		self.placeSubviews()

		self.configure(with: VCFormConfiguration.default)
		self.setupConstraints()
	}

	func placeSubviews() {
		self.addSubview(self.topStackView)

		self.addSubview(self.scrollView)
		self.scrollView.addSubview(self.scrollStackView)

		self.addSubview(self.bottomStackView)
	}

	func setupConstraints() {
		self.topConstraint = self.topStackView.setConstraint(top: 0, to: self)
		self.topStackView.setConstraint(leading: 0, to: self)
		self.topStackView.setConstraint(trailing: 0, to: self)
		self.topStackView.setConstraint(height: 0, priority: .defaultLow)

		self.scrollView.setConstraint(topPadding: 0, to: self.topStackView)
		self.scrollView.setConstraint(leading: 0, to: self)
		self.scrollView.setConstraint(trailing: 0, to: self)
		self.scrollView.setConstraint(bottomPadding: 0, to: self.bottomStackView)

		self.scrollStackView.setConstraint(edges: .zero, to: self.scrollView)
		self.scrollStackView
			.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
			.isActive = true

		self.bottomStackView.setConstraint(leading: 0, to: self)
		self.bottomStackView.setConstraint(trailing: 0, to: self)
		self.bottomConstraint = self.bottomStackView.setConstraint(bottom: 0, to: self)

		self.bottomStackView.setConstraint(height: 0, priority: .defaultLow)
	}

	func setupStackView() {
		self.topStackView.axis = .vertical
		self.scrollStackView.axis = .vertical
		self.bottomStackView.axis = .vertical
	}

	func configure(_ stackView: UIStackView, with config: VCFormConfiguration) {
		stackView.alignment = config.alignment
		stackView.distribution = config.distribution
	}
}

// MARK: utility
private extension VCForm {

	func buildView(with builder: IFormViewBuilder, and id: String, in stackView: UIStackView) {

		// build
		let view = builder.build()
		stackView.addArrangedSubview(view)
		view.sizeToFit()

		// dynamic height
		let animationDuration = self.config.heightAnimationDuration
		(view as? IDynamicHeight)?.heightChangedHandler = { [weak self] _ in
			UIView.animate(withDuration: animationDuration, animations: { self?.layoutIfNeeded() })
		}

		// save for future use
		let element = (id, Weak(view))
		self.placedElements.append(element)
	}
}

private extension VCForm {
	func makeStackViewInsets(with config: VCFormConfiguration, and position: FormPosition) -> UIEdgeInsets {
		var insets = config.contentInsets

		switch position {
		case .top: insets.bottom = 0
		case .scroll: insets.top = 0; insets .bottom = 0
		case .bottom: insets.top = 0
		}

		return insets
	}

	func configureInsets(with config: VCFormConfiguration) {
		self.topConstraint?.constant = config.contentInsets.top
		self.bottomConstraint?.constant = -config.contentInsets.bottom

		// top and bottom set with constraints
		var insets = config.contentInsets
		insets.top = 0
		insets.bottom = 0

		self.set(insets: insets, for: self.topStackView)
		self.set(insets: insets, for: self.scrollStackView)
		self.set(insets: insets, for: self.bottomStackView)
	}

	func set(insets: UIEdgeInsets, for stackView: UIStackView) {
		if #available(iOS 11.0, *) {
			stackView.directionalLayoutMargins =
				NSDirectionalEdgeInsets(top: insets.top,
										leading: insets.left,
										bottom: insets.bottom,
										trailing: insets.right)

			stackView.isLayoutMarginsRelativeArrangement = true
		} else {
			stackView.layoutMargins = insets
		}
	}
}
