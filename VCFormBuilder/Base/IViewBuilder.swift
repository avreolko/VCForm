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

// So, basically, this is two protocols in one
// I needed second one without generic constraints for the form builder
public protocol IFormViewBuilder {
	var buildingMethod: ViewBuildingMethod { get }
	func buildView(with data: Any?) -> UIView
}

public protocol IFormViewConfigurator: Hashable {
	associatedtype ViewData: Any
	associatedtype View: UIView

	func configure(_ view: View, with data: ViewData)
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

	func buildView(with data: Any?) -> UIView {

		let view: View = self.loadView()

		if let unpackedData = data as? ViewData {
			self.configure(view, with: unpackedData)
		} else {
			assertionFailure("Passed data do not match to the specified ViewData")
		}

		return view
	}
}

