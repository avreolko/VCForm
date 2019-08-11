//
//  DynamicHeightViewBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

struct DynamicHeightViewBuilder: IFormViewBuilder, IFormViewConfigurator {
	typealias ViewConfiguration = (collapsedHeight: CGFloat, expandedHeight: CGFloat)
	typealias View = DynamicHeightView

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .xib

	func configure(_ view: View) {
		view.setContentCompressionResistancePriority(.required, for: .vertical)

		view.collapsedHeight = self.configuration.collapsedHeight
		view.expandedHeight = self.configuration.expandedHeight
	}
}
