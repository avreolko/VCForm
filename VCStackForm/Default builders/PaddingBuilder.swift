//
//  PaddingBuilder.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions

struct PaddingBuilder: IFormViewBuilder, IFormViewConfigurator {
	typealias ViewConfiguration = CGFloat
	typealias View = UIView

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual
	var viewHandler: ((View) -> Void)?

	func configure(_ view: View) {
		view.setConstraint(height: self.configuration)
		view.setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
