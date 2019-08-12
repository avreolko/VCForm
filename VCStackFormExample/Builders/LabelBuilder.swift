//
//  UILabelModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCStackForm

struct LabelConfiguration: IViewConfiguration {
	let text: String
	static let `default` = LabelConfiguration(text: "Default text")
}

struct LabelBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = LabelConfiguration
	typealias View = UILabel

	let buildingMethod: ViewBuildingMethod = .manual
	var viewConfiguration: ViewConfiguration = .default
	var viewHandler: ((View) -> Void)? = nil

	init(viewConfiguration: ViewConfiguration = .default, viewHandler: ((View) -> Void)? = nil) {
		self.viewConfiguration = viewConfiguration
		self.viewHandler = viewHandler
	}

	func configure(_ view: View) {
		view.text = self.viewConfiguration.text

		view.font = UIFont.systemFont(ofSize: 14)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
		view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
	}
}
