//
//  IFormBuilder.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public protocol IFormElement {
	var id: String { get }
}

/// Abstraction of form builder, implementation could use stack view or collection view
public protocol IFormBuilder {
	associatedtype ContainerView: UIView
	func append(_ element: IFormElement) -> Self
	func build(in stackView: ContainerView, viewHandler: (IFormElement, UIView) -> Void) -> Self
	func reset() -> Self
}
