//
//  AllBuildersTestViewController.swift
//  VCFormExample
//
//  Created by Valentin Cherepyanko on 04/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import VCForm
import UIKit

class AllBuildersTestViewController: UIViewController {

	@IBOutlet weak var form: VCForm!

	override func viewDidLoad() {
		super.viewDidLoad()

		self.configureForm()
		self.fillForm()
	}
}

private extension AllBuildersTestViewController {

	func configureForm() {
		let insets = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
		let config = VCFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.form.configure(with: config)
	}

	func fillForm() {

		let paddingConfig = PaddingConfiguration(height: 8)

		self.form
			.add(TitleBuilder { $0.text = "Normal text test" }, to: .top)
			.add(LabelBuilder { $0.text = "This is just normal text. It uses multiline UILabel and expands with it contents. It's height also taken into account when UIScrollView tries to calculate content size." })
			.add(PaddingBuilder(viewConfiguration: paddingConfig))
			.add(TitleBuilder { $0.text = "Image test" })
			.add(LabelBuilder { $0.text = "First parameter in data is image itself, second one is the height of UIImageView. If you pass just '200', compiler will think that it's Int, not CGFloat. You should be careful about types of passed data. Or your view will not be configured." })
			.add(ImageViewBuilder(viewConfiguration: .init(image: #imageLiteral(resourceName: "image.jpg"), height: 200)))
			.add(LabelBuilder { $0.text = "Just a footer" }, to: .bottom)
			.build()

	}
}
