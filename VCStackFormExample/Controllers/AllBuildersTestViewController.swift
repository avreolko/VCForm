//
//  AllBuildersTestViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 04/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm
import VCFormBuilder

class AllBuildersTestViewController: UIViewController {

	@IBOutlet weak var stackForm: VCStackForm!
	
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
	}

	func fillForm() {
		var models: [FormElementModel] = []


		var hidden = false
		let buttonData = ("Hide or show image", {
			hidden = !hidden
			self.stackForm.hide(hidden, type: DefaultFormElementType.image)
		})

		let fieldData = {
			print("Text field changed value")
		}

		let dynamicHeightData: (CGFloat, CGFloat) = (collapsedHeight: 50.0, expandedHeight: 150.0)
		models.append((DefaultFormElementType.dynamicHeight, dynamicHeightData))

		models.append((DefaultFormElementType.title, "Normal text test"))
		models.append((DefaultFormElementType.normalText, "This is just normal text. It uses multiline UILabel and expands with it contents. It's height also taken into account when UIScrollView tries to calculate content size."))


		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.title, "Button test"))
		models.append((DefaultFormElementType.normalText, "For button was written custom class with possibility to assign tap handler, that executes every time when button is tapped. Try to tap on it and see in console for some events."))
		models.append((DefaultFormElementType.button, buttonData))


		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.title, "Text field test"))
		models.append((DefaultFormElementType.normalText, "Same as button, it uses custom class with change handler."))
		models.append((DefaultFormElementType.field, fieldData))

		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.title, "Image test"))
		models.append((DefaultFormElementType.normalText, "First parameter in data is image itself, second one is the height of UIImageView. If you pass just '200', compiler will think that it's Int, not CGFloat. You should be careful about types of passed data. Or your view will not be configured."))
		models.append((DefaultFormElementType.image, (#imageLiteral(resourceName: "image"), CGFloat(200))))

		self.stackForm.fill(with: models)
	}
}
