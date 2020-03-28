//
//  VCForm.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCReorderableStackView
import VCExtensions

public enum FormSection {
    case header, scroll, footer
}

public class VCForm: UIView {

    fileprivate var configuration = VCFormConfiguration()

    fileprivate var stacks: [FormSection: ReorderableStackView] = [
        .header: ReorderableStackView(frame: .zero),
        .scroll: ReorderableStackView(frame: .zero),
        .footer: ReorderableStackView(frame: .zero)
    ]

    fileprivate let scrollView = UIScrollView(frame: .zero)

    private var placedViews: [IdentifiableView] = []

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    @discardableResult
    public func add<T: IViewBuilder>(_ viewBuilder: T,
                                     to section: FormSection = .scroll,
                                     viewHandler: ((T.View) -> Void)? = nil) -> Self {

        let view = viewBuilder.buildView()
        self.stacks[section]?.addArrangedSubview(view)

        view.sizeToFit()
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)

        DispatchQueue.main.async {
            view.addObserver(self, forKeyPath: "center", options: NSKeyValueObservingOptions.new, context: nil)
        }

        viewHandler?(view)

        self.placedViews.append(view)

        return self
    }

    // HAAAAACKS!
    override public func observeValue(forKeyPath keyPath: String?,
                                      of object: Any?,
                                      change: [NSKeyValueChangeKey : Any]?,
                                      context: UnsafeMutableRawPointer?) {
        UIView.animate(withDuration: self.configuration.heightAnimationDuration,
                       animations: { self.layoutIfNeeded() })
    }
}

// MARK: - actions

public extension VCForm {

    func hide(_ elementID: String) {
        self.hide(true, id: elementID)
    }

    func show(_ elementID: String) {
        self.hide(false, id: elementID)
    }

    func hide(_ hide: Bool, id: String) {
        self.placedViews
            .filter { $0.id == id }
            .forEach { $0.isHidden = hide }

        UIView.animate(withDuration: self.configuration.heightAnimationDuration, animations: {
            self.layoutIfNeeded()
        })
    }

    func reset() -> Self {
        self.placedViews.forEach { $0.removeFromSuperview() }
        self.placedViews = []
        return self
    }
}

// MARK: - subviews configuration

private extension VCForm {

    func setup() {
        self.placeSubviews()
        self.setupConstraints()
        self.configure()
    }

    func placeSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stacks[.scroll]!)

        self.addSubview(self.stacks[.header]!)
        self.addSubview(self.stacks[.footer]!)
    }

    func setupConstraints() {
        self.stacks[.header]?.setConstraint(top: 0, to: self)
        self.stacks[.header]?.setConstraint(leading: 0, to: self)
        self.stacks[.header]?.setConstraint(trailing: 0, to: self)
        self.stacks[.header]?.setConstraint(height: 0, priority: .defaultLow)

        self.scrollView.setConstraint(topPadding: 0, to: self.stacks[.header]!)
        self.scrollView.setConstraint(leading: 0, to: self)
        self.scrollView.setConstraint(trailing: 0, to: self)
        self.scrollView.setConstraint(bottomPadding: 0, to: self.stacks[.footer]!)

        self.stacks[.scroll]?.setConstraint(edges: .zero, to: self.scrollView)
        self.stacks[.scroll]?
            .widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
            .isActive = true

        self.stacks[.footer]?.setConstraint(leading: 0, to: self)
        self.stacks[.footer]?.setConstraint(trailing: 0, to: self)
        self.stacks[.footer]?.setConstraint(bottom: 0, to: self)

        self.stacks[.footer]?.setConstraint(height: 0, priority: .defaultLow)
    }

    func configure() {
        self.scrollView.clipsToBounds = false
        self.scrollView.showsVerticalScrollIndicator = self.configuration.showScrollIndicator
        self.scrollView.isScrollEnabled = self.configuration.isScrollEnabled

        self.stacks.forEach { section, stack in
            stack.axis = .vertical
            stack.spacing = self.configuration.spacing
            stack.reorderingEnabled = self.configuration.reorderable[section] ?? false
        }
    }
}

// MARK: - form configuration

public extension VCForm {

    var showScrollIndicator: Bool {
        get {
            self.configuration.showScrollIndicator
        }

        set {
            self.configuration.showScrollIndicator = newValue
            self.scrollView.showsVerticalScrollIndicator = newValue
        }
    }

    var isScrollEnabled: Bool {
        get {
            self.configuration.isScrollEnabled
        }

        set {
            self.configuration.isScrollEnabled = newValue
            self.scrollView.isScrollEnabled = newValue
        }
    }

    var heightAnimationDuration: Double {
        get {
            self.configuration.heightAnimationDuration
        }

        set {
            self.configuration.heightAnimationDuration = newValue
        }
    }

    var spacing: CGFloat {
        get {
            self.configuration.spacing
        }

        set {
            self.configuration.spacing = newValue
            self.stacks.values.forEach { $0.spacing = newValue }
        }
    }

    var reorderable: [FormSection: Bool] {
        get {
            self.configuration.reorderable
        }
        set {
            self.configuration.reorderable = newValue

            self.stacks.forEach { section, stack in
                stack.reorderingEnabled = newValue[section] ?? false
            }
        }
    }
}

// MARK: - reorder delegates

public extension VCForm {
    var headerReoderDelegate: IReorderableStackViewDelegate? {
        get {
            self.stacks[.header]?.delegate
        }

        set {
            self.stacks[.header]?.delegate = newValue
        }
    }

    var scrollReoderDelegate: IReorderableStackViewDelegate? {
        get {
            self.stacks[.scroll]?.delegate
        }

        set {
            self.stacks[.scroll]?.delegate = newValue
        }
    }

    var footerReoderDelegate: IReorderableStackViewDelegate? {
        get {
            self.stacks[.footer]?.delegate
        }

        set {
            self.stacks[.footer]?.delegate = newValue
        }
    }
}
