//
//  TextFieldModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

public struct TextFieldBuilder: IFormViewBuilder, IFormViewConfigurator {

	public typealias ViewData = () -> Void
	public typealias View = ActionTextField

	public func configure(_ view: View, with data: @escaping ViewData) {
		view.changeHandler = data
	}
}
