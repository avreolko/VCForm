//
//  ViewBuilder.swift
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
