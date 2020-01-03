//
//  ViewBuilder.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public protocol IdentifiableView: AnyObject {
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
