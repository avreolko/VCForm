//
//  UILabelModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

struct LabelBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = String
	typealias View = UILabel

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual
	var viewHandler: ((View) -> Void)?

	func configure(_ view: View) {
		view.text = self.configuration

		view.font = UIFont.systemFont(ofSize: 14)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
		view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
	}
}
