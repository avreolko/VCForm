//
//  ImageModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions

struct ImageViewBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = (image: UIImage, size: CGFloat)
	typealias View = UIImageView

	let configuration: ViewConfiguration
	let buildingMethod: ViewBuildingMethod = .manual
	var viewHandler: ((View) -> Void)?

	func configure(_ view: View) {
		let imageSize = CGSize(width: CGFloat.greatestFiniteMagnitude,
							   height: self.configuration.size)

		view.image = self.configuration.image.resize(with: imageSize)
		view.contentMode = .scaleAspectFit
		view.clipsToBounds = true
		view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
	}
}

