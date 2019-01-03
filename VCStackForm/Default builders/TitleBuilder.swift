//
//  TitleBuilder.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 02/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

struct TitleBuilder: IFormViewBuilder, IFormViewConfigurator {
	
	public typealias ViewData = String
	public typealias View = UILabel

	public func configure(_ view: View, with data: ViewData) {
		view.text = data

		view.font = UIFont.boldSystemFont(ofSize: 18)
		view.lineBreakMode = .byWordWrapping
		view.numberOfLines = 0
		view.setContentCompressionResistancePriority(.required, for: .vertical)
	}
}
