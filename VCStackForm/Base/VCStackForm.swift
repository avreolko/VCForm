//
//  UIScrollableStackView.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCWeakContainer

public class VCStackForm: UIView {

	public weak var buildersProvider: IBuildersProvider? {
		didSet {
			self.formBuilder.buildersProvider = self.buildersProvider
		}
	}

	private var scrollView = UIScrollView(frame: .zero)
	private var stackView = UIStackView(frame: .zero)

	private var config: VCStackFormConfiguration = .default

	private var formBuilder = StackViewFormBuilder()

	private var elements: [(IFormElementType, Weak<UIView>)] = []

	public override init(frame: CGRect) {
		super.init(frame: frame)
		self.setup()
	}

	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setup()
	}

	public func fill(with elements: [IFormElementType]) {
		self.reset()
		self.formBuilder.reset()

		elements.forEach { (element) in
			self.formBuilder.append(element)
		}

		let animationDuration = self.config.heightAnimationDuration
		self.formBuilder.build(in: self.stackView) { [weak self] (type, view) in
			self?.elements.append((type, Weak(view)))

			(view as? IDynamicHeight)?.heightChangedHandler = { _ in
				UIView.animate(withDuration: animationDuration, animations: { self?.layoutIfNeeded() })
			}
		}
	}

	public func configure(with config: VCStackFormConfiguration) {
		self.config = config

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

	public func update(_ elementType: IFormElementType, with data: Any) {
		// todo: добавить ассерты на случай, когда элемент с таким id есть, но не является IDataView
		self.elements.forEach {
			($0.1.object as? IDataView)?.update(with: data)
		}
	}

	public func hide(_ elementType: IFormElementType) {
		self.hide(true, type: elementType)
	}

	public func show(_ elementType: IFormElementType) {
		self.hide(false, type: elementType)
	}

	public func hide(_ hide: Bool, type: IFormElementType) {
		self.elements
			.filter { $0.0.id == type.id }
			.forEach { $0.1.object?.isHidden = hide }

		UIView.animate(withDuration: self.config.heightAnimationDuration, animations: {
			self.layoutIfNeeded()
		})
	}
}

// MARK: setup
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
}

// MARK: utility
private extension VCStackForm {

	func reset() {
		self.elements.forEach { $0.1.object?.removeFromSuperview() }
		self.elements = []
	}
}
