//
//  TextFieldModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCStackForm

struct TextFieldBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = () -> Void
	typealias View = ActionTextField

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual
	var viewHandler: ((View) -> Void)?

	func configure(_ view: View) {
		view.changeDelay = 0.01
		view.borderStyle = .roundedRect
		view.setConstraint(height: 40)
		view.changeHandler = self.configuration
	}
}
