//
//  UILabelModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

struct LabelBuilder: IFormViewBuilder, IFormViewConfigurator {

	let buildingMethod: ViewBuildingMethod = .manual

	typealias ViewData = String
	typealias View = UILabel

	func configure(_ view: View, with data: ViewData) {
		view.text = data

		view.font = UIFont.systemFont(ofSize: 14)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
		view.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
	}
}
