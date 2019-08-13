//
//  ImageModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCForm

struct ImageViewConfiguration: IViewConfiguration {
	let image: UIImage
	let height: CGFloat

	static let `default` = ImageViewConfiguration(image: #imageLiteral(resourceName: "image.jpg"), height: 200)
}

struct ImageViewBuilder: IFormViewBuilder, IFormViewConfigurator {

	typealias ViewConfiguration = ImageViewConfiguration
	typealias View = UIImageView

	let buildingMethod: ViewBuildingMethod = .manual
	var viewConfiguration: ViewConfiguration = .default
	var viewHandler: ((View) -> Void)? = nil

	init(viewConfiguration: ViewConfiguration = .default, viewHandler: ((View) -> Void)? = nil) {
		self.viewConfiguration = viewConfiguration
		self.viewHandler = viewHandler
	}

	func configure(_ view: View) {
		let imageSize = CGSize(width: CGFloat.greatestFiniteMagnitude,
							   height: self.viewConfiguration.height)

		view.image = self.viewConfiguration.image.resize(with: imageSize)
		view.contentMode = .scaleAspectFit
		view.clipsToBounds = true
		view.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
	}
}

