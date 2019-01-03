//
//  PaddingBuilder.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCExtensions
import VCFormBuilder

struct PaddingBuilder: IFormViewBuilder, IFormViewConfigurator {
	
	public typealias ViewData = NSNumber
	public typealias View = UIView

	public func configure(_ view: View, with data: ViewData) {
		view.setConstraint(height: CGFloat(data.floatValue))
		view.setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
