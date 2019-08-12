//
//  DynamicHeightViewBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import VCStackForm

struct DynamicHeightViewConfiguration: IViewConfiguration {

	let collapsedHeight: CGFloat
	let expandedHeight: CGFloat

	static var `default` = DynamicHeightViewConfiguration(collapsedHeight: 50, expandedHeight: 100)
}

struct DynamicHeightViewBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = DynamicHeightViewConfiguration
	typealias View = DynamicHeightView

	let buildingMethod: ViewBuildingMethod = .xib
	var viewConfiguration: DynamicHeightViewConfiguration = .default
	var viewHandler: ((View) -> Void)? = nil

	init(viewConfiguration: ViewConfiguration = .default, viewHandler: ((View) -> Void)? = nil) {
		self.viewConfiguration = viewConfiguration
		self.viewHandler = viewHandler
	}

	func configure(_ view: View) {
		view.setContentCompressionResistancePriority(.required, for: .vertical)

		view.collapsedHeight = self.viewConfiguration.collapsedHeight
		view.expandedHeight = self.viewConfiguration.expandedHeight
	}
}
