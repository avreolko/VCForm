//
//  ImageModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCExtensions
import VCFormBuilder

public struct ImageViewBuilder: IFormViewBuilder, IFormViewConfigurator {

	public typealias ViewData = (image: UIImage, height: CGFloat)
	public typealias View = UIImageView

	public func configure(_ view: View, with data: ViewData) {
		view.image = data.image
		view.setConstraint(height: data.height)
	}
}

