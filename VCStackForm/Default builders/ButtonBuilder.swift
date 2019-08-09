//
//  ButtonModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

struct ButtonBuilder: IFormViewBuilder, IFormViewConfigurator {

	let buildingMethod: ViewBuildingMethod = .manual

	typealias ViewData = (title: String, changeHandler: () -> Void)
	typealias View = ActionButton

	func configure(_ view: View, with data: ViewData) {
		view.setTitle(data.title, for: .normal)
		view.setTitleColor(.black, for: .normal)
		view.backgroundColor = .lightGray
		view.setContentCompressionResistancePriority(.required, for: .vertical)
		view.tapHandler = data.changeHandler
	}
}
