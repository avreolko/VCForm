//
//  TextFieldModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder
import VCExtensions

struct TextFieldBuilder: IFormViewBuilder, IFormViewConfigurator {

	let buildingMethod: ViewBuildingMethod = .manual

	typealias ViewData = () -> Void
	typealias View = ActionTextField

	func configure(_ view: View, with data: @escaping ViewData) {
		view.changeDelay = 0.01
		view.borderStyle = .roundedRect
		view.setConstraint(height: 40)
		view.changeHandler = data
	}
}
