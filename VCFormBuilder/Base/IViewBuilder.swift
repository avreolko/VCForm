//
//  StackSubviewModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public enum ViewBuildingMethod {
	case xib, manual
}

public protocol IFormViewBuilder {
	var buildingMethod: ViewBuildingMethod { get }
	func build() -> UIView
}

public protocol IFormViewConfigurator {
	associatedtype ViewConfiguration: Any
	associatedtype View: UIView

	var configuration: ViewConfiguration { get }
	var viewHandler: ((View) -> Void)? { get set }

	func configure(_ view: View)
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
													   owner: self,
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
}

