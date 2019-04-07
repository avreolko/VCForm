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
	public typealias ViewData = (collapsedHeight: CGFloat, expandedHeight: CGFloat)
	public typealias View = DynamicHeightView

	public func configure(_ view: View, with data: ViewData) {
		view.setContentCompressionResistancePriority(.required, for: .vertical)

		view.collapsedHeight = data.collapsedHeight
		view.expandedHeight = data.expandedHeight
	}

	public func buildView(with data: Any?) -> UIView {
		guard let dynamicHeightView =
			Bundle(for: DynamicHeightView.self)
			.loadNibNamed("DynamicHeightView", owner: self, options: nil)?
			.first as? DynamicHeightView else {

			assertionFailure("Failed to load DynamicHeightView.")
			return UIView()
		}

		if let unpackedData = data as? ViewData {
			self.configure(dynamicHeightView, with: unpackedData)
		} else {
			assertionFailure("Passed data do not match to the specified ViewData")
		}

		return dynamicHeightView
	}
}
