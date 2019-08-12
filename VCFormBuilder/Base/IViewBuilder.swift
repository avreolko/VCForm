//
//  StackSubviewModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public protocol IViewConfiguration {
	static var `default`: Self { get }
}

public protocol IFormViewConfigurator {
	associatedtype ViewConfiguration: IViewConfiguration
	associatedtype View: UIView

	var viewConfiguration: ViewConfiguration { get set }
	var viewHandler: ((View) -> Void)? { get set }

	func configure(_ view: View)
}

public enum ViewBuildingMethod {
	case xib, manual
}

public protocol IFormViewBuilder {
	var buildingMethod: ViewBuildingMethod { get }
	func build() -> UIView
}

// MARK: Default implementations
public extension IFormViewBuilder where Self: IFormViewConfigurator {

	func loadView() -> View {

		var view: View? = nil

		if self.buildingMethod == .manual {
			view = View(frame: .zero)
		}
		else if self.buildingMethod == .xib {
			view = Bundle(for: View.self).loadNibNamed(String(describing: View.self),
													   owner: nil,
													   options: nil)?.first as? View
		}

		return view ?? View(frame: .zero)
	}

	func build() -> UIView {
		let view: View = self.loadView()
		self.configure(view)
		self.viewHandler?(view)
		return view
	}

	func configure(_ view: View) { }
}

