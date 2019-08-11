//
//  TitleBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 02/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

struct TitleBuilder: IFormViewBuilder, IFormViewConfigurator {
	typealias ViewConfiguration = String
	typealias View = UILabel

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual

	func configure(_ view: View) {
		view.text = self.configuration

		view.font = UIFont.boldSystemFont(ofSize: 18)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
