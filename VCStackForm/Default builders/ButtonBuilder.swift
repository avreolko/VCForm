//
//  ButtonModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

struct ButtonBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = (title: String, changeHandler: () -> Void)
	typealias View = ActionButton

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual
	var viewHandler: ((View) -> Void)?

	func configure(_ view: View) {
		view.setTitle(self.configuration.title, for: .normal)
		view.setTitleColor(.black, for: .normal)
		view.backgroundColor = .lightGray
		view.setContentCompressionResistancePriority(.required, for: .vertical)
		view.tapHandler = self.configuration.changeHandler
	}
}
