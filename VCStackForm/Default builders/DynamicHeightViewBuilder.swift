//
//  DynamicHeightViewBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

struct DynamicHeightViewBuilder: IFormViewBuilder, IFormViewConfigurator {

	let buildingMethod: ViewBuildingMethod = .xib

	typealias ViewData = (collapsedHeight: CGFloat, expandedHeight: CGFloat)
	typealias View = DynamicHeightView

	func configure(_ view: View, with data: ViewData) {
		view.setContentCompressionResistancePriority(.required, for: .vertical)

		view.collapsedHeight = data.collapsedHeight
		view.expandedHeight = data.expandedHeight
	}
}
