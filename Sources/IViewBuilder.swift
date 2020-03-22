//
//  ViewBuilder.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCExtensions

public protocol IdentifiableView: UIView {
    var id: String { get }
}

extension UIView: IdentifiableView {
    public var id: String {
        return String(describing: self)
    }
}

public protocol IViewBuilder {
    associatedtype View: UIView
    func buildView() -> View
}

public struct Builder<View: UIView>: IViewBuilder {

    private let viewHandler: ((View) -> Void)?

    public init(viewHandler: ((View) -> Void)? = nil) {
        self.viewHandler = viewHandler
    }

    public func buildView() -> View {
        let view = View(frame: .zero)
        self.viewHandler?(view)
        return view
    }
}

public struct XibBuilder<View: UIView>: IViewBuilder {

    private let viewHandler: ((View) -> Void)?

    public init(viewHandler: ((View) -> Void)? = nil) {
        self.viewHandler = viewHandler
    }

    public func buildView() -> View {

        guard let view: View = View.loadFromXib() else {
            fatalError("There is no .xib file with name: \(String(describing: View.self))")
        }

        self.viewHandler?(view)
        return view
    }
}
