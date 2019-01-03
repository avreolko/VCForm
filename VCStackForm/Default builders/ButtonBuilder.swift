//
//  ButtonModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

public struct ButtonBuilder: IFormViewBuilder, IFormViewConfigurator {

	public typealias ViewData = (title: String, changeHandler: () -> Void)
	public typealias View = ActionButton

	public func configure(_ view: View, with data: ViewData) {
		view.setTitle(data.title, for: .normal)
		view.tapHandler = data.changeHandler
	}
}
