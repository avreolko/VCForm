//
//  FormView.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import VCReorderableStackView

public enum FormSection {
    case header, scroll, footer
}

public class FormView: UIView {

    fileprivate var configuration = FormViewConfiguration()

    fileprivate var stacks: [FormSection: ReorderableStackView] = [
        .header: ReorderableStackView(frame: .zero),
        .scroll: ReorderableStackView(frame: .zero),
        .footer: ReorderableStackView(frame: .zero)
    ]

    public let scrollView = UIScrollView(frame: .zero)

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
        viewHandler?(view)
        self.placedViews.append(view)

        return self
    }

    @discardableResult
    public func addArrangedSubview(
        _ view: UIView,
        to section: FormSection = .scroll
    ) -> Self {
        self.stacks[section]?.addArrangedSubview(view)
        self.placedViews.append(view)
        return self
    }
}

// MARK: - actions

public extension FormView {

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

private extension FormView {

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

        self.stacks[.header]?.topAnchor.pin(to: self.topAnchor)
        self.stacks[.header]?.leadingAnchor.pin(to: self.leadingAnchor)
        self.stacks[.header]?.trailingAnchor.pin(to: self.trailingAnchor)

        let headerHeightConstraint = self.stacks[.header]?.heightAnchor.constraint(equalToConstant: 0)
        headerHeightConstraint?.priority = .defaultLow
        headerHeightConstraint?.isActive = true

        self.scrollView.topAnchor.pin(to: self.stacks[.header]!.bottomAnchor)
        self.scrollView.leadingAnchor.pin(to: self.leadingAnchor)
        self.scrollView.trailingAnchor.pin(to: self.trailingAnchor)
        self.scrollView.bottomAnchor.pin(to: self.stacks[.footer]!.topAnchor)

        self.stacks[.scroll]?.leadingAnchor.pin(to: self.scrollView.leadingAnchor)
        self.stacks[.scroll]?.topAnchor.pin(to: self.scrollView.topAnchor)
        self.stacks[.scroll]?.trailingAnchor.pin(to: self.scrollView.trailingAnchor)
        self.stacks[.scroll]?.bottomAnchor.pin(to: self.scrollView.bottomAnchor)

        self.stacks[.scroll]?
            .widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
            .isActive = true

        self.stacks[.footer]?.leadingAnchor.pin(to: self.leadingAnchor)
        self.stacks[.footer]?.trailingAnchor.pin(to: self.trailingAnchor)
        self.stacks[.footer]?.bottomAnchor.pin(to: self.bottomAnchor)

        let footerHeightConstraint = self.stacks[.footer]?.heightAnchor.constraint(equalToConstant: 0)
        footerHeightConstraint?.priority = .defaultLow
        footerHeightConstraint?.isActive = true
    }

    func configure() {
        self.scrollView.clipsToBounds = false
        self.scrollView.showsVerticalScrollIndicator = self.configuration.showScrollIndicator
        self.scrollView.isScrollEnabled = self.configuration.isScrollEnabled

        self.stacks.forEach { section, stack in
            stack.reorderingEnabled = self.configuration.reorderable[section] ?? false
            stack.spacing = self.configuration.spacing
            stack.isLayoutMarginsRelativeArrangement = true
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .equalSpacing
        }
    }
}

// MARK: - access

public extension FormView {
    func arrangedSubviews<T: UIView>(from section: FormSection) -> [T] {
        self.stacks[section]?
            .arrangedSubviews
            .compactMap { $0 as? T } ?? []
    }

    func scroll(to view: UIView) {
        self.scrollView.setContentOffset(view.frame.origin, animated: true)
    }
}

// MARK: - form configuration

public extension FormView {

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

public extension FormView {
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

private extension NSLayoutAnchor {

    @objc
    @discardableResult
    func pin(to anchor: NSLayoutAnchor<AnchorType>,
             offset: CGFloat = 0,
             priority: UILayoutPriority = .required) -> NSLayoutConstraint {

        let constraint = self.constraint(equalTo: anchor, constant: offset)
        (constraint.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        constraint.priority = priority
        NSLayoutConstraint.activate([constraint])
        return constraint
    }
}
