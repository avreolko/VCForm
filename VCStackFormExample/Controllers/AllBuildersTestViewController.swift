//
//  AllBuildersTestViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 04/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import VCStackForm

class AllBuildersTestViewController: UIViewController {

	@IBOutlet weak var stackForm: VCStackForm!

	private let buildersProvider = BuildersProvider()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.configureForm()
		self.fillForm()
	}
}

private extension AllBuildersTestViewController {

	func configureForm() {
		let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		let config = VCStackFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.stackForm.configure(with: config)
		self.stackForm.buildersProvider = self.buildersProvider
	}

	func fillForm() {
		var models: [DefaultFormElementType] = []

		models.append(.dynamicHeight(50, 100))

		models.append(.title("Normal text test"))
		models.append(.normalText("This is just normal text. It uses multiline UILabel and expands with it contents. It's height also taken into account when UIScrollView tries to calculate content size."))


		models.append(.padding(20))
		models.append(.title("Button test"))
		models.append(.normalText("For button was written custom class with possibility to assign tap handler, that executes every time when button is tapped. Try to tap on it and see in console for some events."))

		var hidden = false
		models.append(.button("Hide or show image", {
			hidden = !hidden
			self.stackForm.hide(hidden, type: DefaultFormElementType.image(#imageLiteral(resourceName: "image"), 200))
		}))

		models.append(.padding(20))
		models.append(.title("Text field test"))
		models.append(.normalText("Same as button, it uses custom class with change handler."))
		models.append(.field({ print("Text field changed value") }))

		models.append(.padding(20))
		models.append(.title("Image test"))
		models.append(.normalText("First parameter in data is image itself, second one is the height of UIImageView. If you pass just '200', compiler will think that it's Int, not CGFloat. You should be careful about types of passed data. Or your view will not be configured."))
		models.append(.image(#imageLiteral(resourceName: "image"), 200))

		self.stackForm.fill(with: models)
	}
}
