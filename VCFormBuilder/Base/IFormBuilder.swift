//
//  IFormBuilder.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public protocol IFormElementType {
	var id: String { get }
	var formViewBuilder: IFormViewBuilder { get }
}

public typealias FormElementModel = (type: IFormElementType, data: Any)

/// Protocol for the views with dynamic data
@objc
public protocol IDataView: AnyObject {
	func update(with data: Any)
}

/// Abstraction of form builder, implementation could use stack view or collection view
public protocol IFormBuilder {
	associatedtype ContainerView: UIView
	func append(_ model: FormElementModel) -> Self
	func build(in stackView: ContainerView, viewHandler: (IFormElementType, UIView) -> Void) -> Self
	func reset() -> Self
}
