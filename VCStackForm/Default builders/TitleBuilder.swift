//
//  TitleBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 02/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

struct TitleBuilder: IFormViewBuilder, IFormViewConfigurator {

	let buildingMethod: ViewBuildingMethod = .manual

	typealias ViewData = String
	typealias View = UILabel

	func configure(_ view: View, with data: ViewData) {
		view.text = data

		view.font = UIFont.boldSystemFont(ofSize: 18)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
