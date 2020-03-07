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

public enum FormPosition {
    case top, scroll, bottom
}

public class VCForm: UIView {

    public var configuration = VCFormConfiguration() {
        didSet { self.configure() }
    }

    private var buildersBlocks = [() -> Void]()

    var stacks: [FormPosition: UIStackView] = [
        .top: ReorderableStackView(frame: .zero),
        .scroll: ReorderableStackView(frame: .zero),
        .bottom: ReorderableStackView(frame: .zero)
    ]

    private let scrollView = UIScrollView(frame: .zero)
    var placedViews: [(String, UIView)] = []

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
                                     to position: FormPosition = .scroll,
                                     viewHandler: ((T.View) -> Void)? = nil) -> Self {

        let builderBlock = self.makeBuilderBlock(with: viewBuilder,
                                                 stackView: self.stacks[position],
                                                 handler: viewHandler)
        self.buildersBlocks.append(builderBlock)
        return self
    }

    @discardableResult
    public func build() -> Self {
        self.buildersBlocks.forEach { $0() }
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

public extension VCForm {

    func hide(_ elementID: String) {
        self.hide(true, id: elementID)
    }

    func show(_ elementID: String) {
        self.hide(false, id: elementID)
    }

    func hide(_ hide: Bool, id: String) {
        self.placedViews
            .filter { $0.0 == id }
            .forEach { $0.1.isHidden = hide }

        UIView.animate(withDuration: self.configuration.heightAnimationDuration, animations: {
            self.layoutIfNeeded()
        })
    }

    func reset() {
        self.placedViews.forEach { $0.1.removeFromSuperview() }
        self.placedViews = []
        self.buildersBlocks = []
    }
}

private extension VCForm {
    // type erasure
    func makeBuilderBlock<T: IViewBuilder>(with builder: T,
                                           stackView: UIStackView?,
                                           handler: ((T.View) -> Void)?) -> () -> Void {
        return { [weak self] in
            let view = builder.buildView()
            stackView?.addArrangedSubview(view)

            view.sizeToFit()
            view.setContentCompressionResistancePriority(.required, for: .vertical)
            view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)

            DispatchQueue.main.async {
                view.addObserver(self!, forKeyPath: "center", options: NSKeyValueObservingOptions.new, context: nil)
            }

            handler?(view)

            self?.placedViews.append((view.id, view))
        }
    }
}

private extension VCForm {

    func setup() {
        self.configureStacks()
        self.placeSubviews()
        self.setupConstraints()
        self.configure()
    }

    func configureStacks() {
        self.stacks[.top]?.axis = .vertical
        self.stacks[.scroll]?.axis = .vertical
        self.stacks[.bottom]?.axis = .vertical
    }

    func placeSubviews() {
        self.addSubview(self.stacks[.top]!)

        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stacks[.scroll]!)

        self.addSubview(self.stacks[.bottom]!)
    }

    func setupConstraints() {
        self.stacks[.top]?.setConstraint(top: 0, to: self)
        self.stacks[.top]?.setConstraint(leading: 0, to: self)
        self.stacks[.top]?.setConstraint(trailing: 0, to: self)
        self.stacks[.top]?.setConstraint(height: 0, priority: .defaultLow)

        self.scrollView.setConstraint(topPadding: 0, to: self.stacks[.top]!)
        self.scrollView.setConstraint(leading: 0, to: self)
        self.scrollView.setConstraint(trailing: 0, to: self)
        self.scrollView.setConstraint(bottomPadding: 0, to: self.stacks[.bottom]!)

        self.stacks[.scroll]?.setConstraint(edges: .zero, to: self.scrollView)
        self.stacks[.scroll]?
            .widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1.0)
            .isActive = true

        self.stacks[.bottom]?.setConstraint(leading: 0, to: self)
        self.stacks[.bottom]?.setConstraint(trailing: 0, to: self)
        self.stacks[.bottom]?.setConstraint(bottom: 0, to: self)

        self.stacks[.bottom]?.setConstraint(height: 0, priority: .defaultLow)
    }

    func configure() {

        self.scrollView.showsVerticalScrollIndicator = self.configuration.showScrollIndicator
        self.scrollView.isScrollEnabled = self.configuration.isScrollEnabled
        self.scrollView.clipsToBounds = false

        self.stacks.values.forEach { stack in
            stack.spacing = self.configuration.spacing
            guard let reorderableStackView = stack as? ReorderableStackView else { return }
            reorderableStackView.reorderingEnabled = self.configuration.reorderable
        }
    }
}
